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

static void xm_exec(unsigned addr)
{
  addr &= 0xFFFFFFu;
  cur_pc = addr;
  instr_count++;
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
