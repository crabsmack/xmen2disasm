/* Execution tracing for the xmen2disasm harness, built into Genesis Plus GX
 * (HOOK_CPU). Exported alongside the libretro API; driven from emu/xmen2emu.py.
 *
 * Records every 68000 instruction start:
 *   - cumulative and per-frame bitmaps over ROM ($000000-$3FFFFF, 1 bit per word)
 *   - a bitmap over work RAM ($FF0000-$FFFFFF) for code executed from RAM
 * plus a register snapshot accessor.
 */
#include <string.h>
#include "shared.h"
#include "cpuhook.h"

#if defined(_WIN32)
#define XM_EXPORT __declspec(dllexport)
#else
#define XM_EXPORT __attribute__((visibility("default")))
#endif

#define ROM_SPAN 0x400000u
#define ROM_BITS (ROM_SPAN / 2u)
#define RAM_BITS (0x10000u / 2u)

static unsigned char rom_total[ROM_BITS / 8];
static unsigned char rom_frame[ROM_BITS / 8];
static unsigned char ram_total[RAM_BITS / 8];
static unsigned long long instr_count;

static void xm_hook(hook_type_t type, int width, unsigned int address, unsigned int value)
{
  (void)width; (void)value;
  if (type != HOOK_M68K_E)
    return;
  address &= 0xFFFFFFu;
  instr_count++;
  if (address < ROM_SPAN) {
    unsigned int bit = address >> 1;
    rom_total[bit >> 3] |= (unsigned char)(1u << (bit & 7));
    rom_frame[bit >> 3] |= (unsigned char)(1u << (bit & 7));
  } else if (address >= 0xFF0000u) {
    unsigned int bit = (address - 0xFF0000u) >> 1;
    ram_total[bit >> 3] |= (unsigned char)(1u << (bit & 7));
  }
}

XM_EXPORT void xm_trace_enable(int on)
{
  set_cpu_hook(on ? xm_hook : NULL);
}

XM_EXPORT void xm_trace_reset(void)
{
  memset(rom_total, 0, sizeof rom_total);
  memset(rom_frame, 0, sizeof rom_frame);
  memset(ram_total, 0, sizeof ram_total);
  instr_count = 0;
}

XM_EXPORT void xm_frame_clear(void) { memset(rom_frame, 0, sizeof rom_frame); }
XM_EXPORT unsigned char *xm_rom_total(void) { return rom_total; }
XM_EXPORT unsigned char *xm_rom_frame(void) { return rom_frame; }
XM_EXPORT unsigned char *xm_ram_total(void) { return ram_total; }
XM_EXPORT unsigned int xm_bitmap_bytes(void) { return ROM_BITS / 8; }
XM_EXPORT unsigned long long xm_instr_count(void) { return instr_count; }

/* d0-d7, a0-a7, pc, sr */
XM_EXPORT void xm_get_regs(unsigned int *out)
{
  int i;
  for (i = 0; i < 16; i++)
    out[i] = m68k_get_reg((m68k_register_t)(M68K_REG_D0 + i));
  out[16] = m68k_get_reg(M68K_REG_PC);
  out[17] = m68k_get_reg(M68K_REG_SR);
}
