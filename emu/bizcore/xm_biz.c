/* xmen2disasm glue for BizHawk 2.4's gpgx (the core the TAS was recorded on).
 *
 * BizHawk exposes biz_execcb (every 68000 instruction) and biz_cdcallback (its
 * Code/Data Logger: executed bytes, data reads, DMA sources). We record them in
 * C bitmaps so Python never sees per-instruction callbacks:
 *   exec_total / exec_frame : 1 bit per ROM word ($000000-$3FFFFF) executed as an instruction start
 *   data_total              : 1 bit per ROM byte read as data by the 68000
 *   dma_total               : 1 bit per ROM byte used as a VDP DMA source
 *   reader                  : per ROM byte, the first instruction that read it as data
 *                             (XM_READ | pc) or, for DMA, the instruction executing when the
 *                             DMA ran (XM_DMA | pc): who uses each data span
 */
#include <stdlib.h>
#include <string.h>
#include "callbacks.h"
#include "shared.h"

#define XM_EXPORT __declspec(dllexport)
#define ROM_SPAN 0x400000u

static unsigned char exec_total[ROM_SPAN / 16];
static unsigned char exec_frame[ROM_SPAN / 16];
static unsigned char data_total[ROM_SPAN / 8];
static unsigned char dma_total[ROM_SPAN / 8];
static unsigned char ram_exec[0x10000 / 16];
static unsigned long long instr_count;
static unsigned int reader[ROM_SPAN];
static unsigned int dma_dest[ROM_SPAN];  /* XM_DMA | VDP code << 16 | VDP address, first DMA of each byte */
static unsigned int cur_pc;
static unsigned int cur_dma;              /* VDP code/address of the DMA word being logged */
#define XM_READ 0x01000000u
#define XM_DMA 0x02000000u

/* Per-instruction cycle trace (phase 2 first-divergence work): while armed, every instruction
   start appends {pc, m68k.cycles (master clocks since frame start), sr, a7}; xm_ctrace_mark adds
   a frame marker {0xFFFFFFFF, frame}. Read back with xm_ctrace_buf / xm_ctrace_len.
   rh = word-wise FNV-1a over D0-D7/A0-A7, so the first wrong register value shows. */
typedef struct { unsigned pc, cyc, sr, a7, rh; } XmCtrace;
static XmCtrace *ctrace;
static unsigned ctrace_len, ctrace_cap;

XM_EXPORT int xm_ctrace_arm(unsigned cap)
{
  free(ctrace);
  ctrace = cap ? (XmCtrace *)malloc((size_t)cap * sizeof *ctrace) : NULL;
  ctrace_cap = ctrace ? cap : 0;
  ctrace_len = 0;
  return ctrace != NULL || !cap;
}
XM_EXPORT void xm_ctrace_mark(unsigned frame)
{
  if (ctrace_len < ctrace_cap) {
    XmCtrace *e = &ctrace[ctrace_len++];
    e->pc = 0xFFFFFFFFu; e->cyc = frame; e->sr = 0; e->a7 = 0; e->rh = 0;
  }
}
/* Register probe: every execution of probe_pc (while armed) records frame-relative cycles and
   D0-D7/A0-A7, up to 256 hits; xm_rprobe_buf returns 18 words per hit (cyc, sr, dar[16]). */
static unsigned probe_pc = 0xFFFFFFFFu, probe_len;
static unsigned probe_buf[256 * 18];
XM_EXPORT void xm_rprobe_arm(unsigned pc) { probe_pc = pc; probe_len = 0; }
XM_EXPORT unsigned *xm_rprobe_buf(void) { return probe_buf; }
XM_EXPORT unsigned xm_rprobe_len(void) { return probe_len; }

/* Z80 instruction trace (armed with the 68000 one): {pc, Z80.cycles (master clocks), regs hash,
   frame marker as pc 0xFFFFFFFF}. Hash: word-wise FNV-1a over AF BC DE HL IX IY SP AF' BC' DE'
   HL' (16-bit values), the same as the runner's exact-mode Z80 trace. */
#include "z80.h"
typedef struct { unsigned pc, cyc, rh; } XmZtrace;
static XmZtrace *ztrace;
static unsigned ztrace_len, ztrace_cap;
XM_EXPORT int xm_ztrace_arm(unsigned cap)
{
  free(ztrace);
  ztrace = cap ? (XmZtrace *)malloc((size_t)cap * sizeof *ztrace) : NULL;
  ztrace_cap = ztrace ? cap : 0;
  ztrace_len = 0;
  return ztrace != NULL || !cap;
}
XM_EXPORT void xm_ztrace_mark(unsigned frame)
{
  if (ztrace_len < ztrace_cap) {
    XmZtrace *e = &ztrace[ztrace_len++];
    e->pc = 0xFFFFFFFFu; e->cyc = frame; e->rh = 0;
  }
}
XM_EXPORT XmZtrace *xm_ztrace_buf(void) { return ztrace; }

/* YM2612 access log (armed with the Z80 trace): {cycles, address (| 0x100 = status read),
   data, fm_cycles_count, timer counters TAC | TBC << 16} for every fm_write / fm_read (after the
   chip caught up, before the write), frame markers as cycles 0xFFFFFFFF. */
typedef struct { unsigned cyc, addr, data, fmc, tim; } XmFm;
static XmFm fmlog[1 << 16];
static unsigned fmlog_len;
extern unsigned xm_ym_timers(void);
XM_EXPORT void xm_fm_mark(unsigned frame)
{
  if (ztrace && fmlog_len < (1u << 16)) {
    XmFm *e = &fmlog[fmlog_len++];
    e->cyc = 0xFFFFFFFFu; e->addr = frame; e->data = 0; e->fmc = 0; e->tim = 0;
  }
}
void xm_fm_note(unsigned cyc, unsigned addr, unsigned data, unsigned fmc)
{
  if (ztrace && fmlog_len < (1u << 16)) {
    XmFm *e = &fmlog[fmlog_len++];
    e->cyc = cyc; e->addr = addr; e->data = data; e->fmc = fmc; e->tim = xm_ym_timers();
  }
}
XM_EXPORT XmFm *xm_fm_buf(void) { return fmlog; }
XM_EXPORT unsigned xm_fm_len(void) { return fmlog_len; }
XM_EXPORT unsigned xm_ztrace_len(void) { return ztrace_len; }
void xm_z80_exec(void)
{
  if (ztrace_len < ztrace_cap) {
    XmZtrace *e = &ztrace[ztrace_len++];
    unsigned v[11], h = 2166136261u, i;
    v[0] = Z80.af.w.l; v[1] = Z80.bc.w.l; v[2] = Z80.de.w.l; v[3] = Z80.hl.w.l;
    v[4] = Z80.ix.w.l; v[5] = Z80.iy.w.l; v[6] = Z80.sp.w.l;
    v[7] = Z80.af2.w.l; v[8] = Z80.bc2.w.l; v[9] = Z80.de2.w.l; v[10] = Z80.hl2.w.l;
    for (i = 0; i < 11; i++) h = (h ^ v[i]) * 16777619u;
    e->pc = Z80.pc.w.l; e->cyc = Z80.cycles; e->rh = h;
  }
}

XM_EXPORT XmCtrace *xm_ctrace_buf(void) { return ctrace; }
XM_EXPORT unsigned xm_ctrace_len(void) { return ctrace_len; }

static void xm_exec(unsigned addr)
{
  addr &= 0xFFFFFFu;
  cur_pc = addr;
  instr_count++;
  if (ctrace_len < ctrace_cap) {
    XmCtrace *e = &ctrace[ctrace_len++];
    e->pc = addr; e->cyc = m68k.cycles;
    e->sr = m68k_get_reg(M68K_REG_SR); e->a7 = m68k_get_reg(M68K_REG_A7);
    {
      unsigned h = 2166136261u, i;
      for (i = 0; i < 16; i++) h = (h ^ m68k.dar[i]) * 16777619u;
      e->rh = h;
    }
  }
  if (addr == probe_pc && probe_len < 256) {
    unsigned *p = &probe_buf[probe_len++ * 18], i;
    p[0] = m68k.cycles; p[1] = m68k_get_reg(M68K_REG_SR);
    for (i = 0; i < 16; i++) p[2 + i] = m68k.dar[i];
  }
  if (addr < ROM_SPAN) {
    unsigned bit = addr >> 1;
    exec_total[bit >> 3] |= (unsigned char)(1u << (bit & 7));
    exec_frame[bit >> 3] |= (unsigned char)(1u << (bit & 7));
  } else if (addr >= 0xFF0000u) {
    unsigned bit = (addr & 0xFFFFu) >> 1;
    ram_exec[bit >> 3] |= (unsigned char)(1u << (bit & 7));
  }
}

static void xm_cdl(int32 addr, int32 addrtype, int32 flags)
{
  if (addrtype != eCDLog_AddrType_MDCART || (unsigned)addr >= ROM_SPAN)
    return;
  if (flags & eCDLog_Flags_Data68k) {
    data_total[addr >> 3] |= (unsigned char)(1u << (addr & 7));
    if (!(reader[addr] & XM_READ))
      reader[addr] = XM_READ | cur_pc;
  }
  if (flags & eCDLog_Flags_DMASource) {
    dma_total[addr >> 3] |= (unsigned char)(1u << (addr & 7));
    if (!reader[addr])
      reader[addr] = XM_DMA | cur_pc;
    if (!dma_dest[addr])  /* both bytes of a word go to the same VDP word */
      dma_dest[addr] = XM_DMA | cur_dma;
  }
}

XM_EXPORT void xm_trace_enable(int on)
{
  biz_execcb = on ? xm_exec : NULL;
  biz_cdcallback = on ? xm_cdl : NULL;
}

XM_EXPORT void xm_trace_reset(void)
{
  memset(exec_total, 0, sizeof exec_total);
  memset(exec_frame, 0, sizeof exec_frame);
  memset(data_total, 0, sizeof data_total);
  memset(dma_total, 0, sizeof dma_total);
  memset(ram_exec, 0, sizeof ram_exec);
  memset(reader, 0, sizeof reader);
  memset(dma_dest, 0, sizeof dma_dest);
  instr_count = 0;
}

XM_EXPORT void xm_frame_clear(void) { memset(exec_frame, 0, sizeof exec_frame); }
XM_EXPORT unsigned char *xm_rom_total(void) { return exec_total; }
XM_EXPORT unsigned char *xm_rom_frame(void) { return exec_frame; }
XM_EXPORT unsigned char *xm_ram_total(void) { return ram_exec; }
XM_EXPORT unsigned char *xm_data_total(void) { return data_total; }
XM_EXPORT unsigned char *xm_dma_total(void) { return dma_total; }
XM_EXPORT unsigned int *xm_reader(void) { return reader; }
XM_EXPORT unsigned int *xm_dma_dest(void) { return dma_dest; }

/* Called by the patched vdp_ctrl.c (emu/build_core.py patch_biz) before each DMA source word is
   logged: code = VDP code register (bits 0-3: 1 VRAM, 3 CRAM, 5 VSRAM), addr = destination. */
void xm_dma_note(unsigned int code, unsigned int addr)
{
  cur_dma = ((code & 0x3Fu) << 16) | (addr & 0xFFFFu);
}
XM_EXPORT unsigned int xm_bitmap_bytes(void) { return sizeof exec_total; }
XM_EXPORT unsigned long long xm_instr_count(void) { return instr_count; }
XM_EXPORT unsigned char *xm_work_ram(void) { return work_ram; }

/* Video and sound memory for the per-frame reference CRCs (phase 2, K2). gpgx keeps VRAM and
   VSRAM as host-order words and CRAM packed to 9 bits (BBBGGGRRR); xmen2emu.py converts. */
XM_EXPORT unsigned char *xm_vram(void) { return vram; }
XM_EXPORT unsigned char *xm_cram(void) { return cram; }
XM_EXPORT unsigned char *xm_vsram(void) { return vsram; }
XM_EXPORT unsigned char *xm_zram(void) { return zram; }

/* BizHawk "Normal" control type: P1 -> input.pad[0], P2 -> input.pad[4] */
XM_EXPORT void xm_set_pads(unsigned short p1, unsigned short p2)
{
  input.pad[0] = p1;
  input.pad[4] = p2;
}

XM_EXPORT void xm_get_regs(unsigned int *out)
{
  int i;
  for (i = 0; i < 16; i++)
    out[i] = m68k_get_reg((m68k_register_t)(M68K_REG_D0 + i));
  out[16] = m68k_get_reg(M68K_REG_PC);
  out[17] = m68k_get_reg(M68K_REG_SR);
}
