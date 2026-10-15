/* Native-DLL stand-in for BizHawk's waterbox emulibc.h (not in the sparse gpgx checkout).
 * Waterbox seals/hides these allocations; a plain DLL just needs zeroed memory. */
#ifndef EMULIBC_H
#define EMULIBC_H
#include <stdlib.h>

#define ECL_ENTRY
#define ECL_EXPORT __declspec(dllexport)
#define ECL_INVISIBLE
#define ECL_SEALED

static __inline void *alloc_sealed(size_t size) { return calloc(1, size); }
static __inline void *alloc_invisible(size_t size) { return calloc(1, size); }
static __inline void _debug_puts(const char *s) { (void)s; }

#endif
