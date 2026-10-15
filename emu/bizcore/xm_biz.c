/* xmen2disasm glue for BizHawk 2.4's gpgx (the core the TAS was recorded on).
 *
 * BizHawk exposes biz_execcb (every 68000 instruction) and biz_cdcallback (its
 * Code/Data Logger: executed bytes, data reads, DMA sources). We record them in
 * C bitmaps so Python never sees per-instruction callbacks:
 *   exec_total / exec_frame : 1 bit per ROM word ($000000-$3FFFFF) executed as an instruction start
 *   data_total              : 1 bit per ROM byte read as data by the 68000
 *   dma_total               : 1 bit per ROM byte used as a VDP DMA source
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

static void xm_exec(unsigned addr)
{
  addr &= 0xFFFFFFu;
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
  if (flags & eCDLog_Flags_Data68k)
    data_total[addr >> 3] |= (unsigned char)(1u << (addr & 7));
  if (flags & eCDLog_Flags_DMASource)
    dma_total[addr >> 3] |= (unsigned char)(1u << (addr & 7));
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
  instr_count = 0;
}

XM_EXPORT void xm_frame_clear(void) { memset(exec_frame, 0, sizeof exec_frame); }
XM_EXPORT unsigned char *xm_rom_total(void) { return exec_total; }
XM_EXPORT unsigned char *xm_rom_frame(void) { return exec_frame; }
XM_EXPORT unsigned char *xm_ram_total(void) { return ram_exec; }
XM_EXPORT unsigned char *xm_data_total(void) { return data_total; }
XM_EXPORT unsigned char *xm_dma_total(void) { return dma_total; }
XM_EXPORT unsigned int xm_bitmap_bytes(void) { return sizeof exec_total; }
XM_EXPORT unsigned long long xm_instr_count(void) { return instr_count; }
XM_EXPORT unsigned char *xm_work_ram(void) { return work_ram; }

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
