# Genesis Plus GX libretro core + xm_trace execution hooks, as one DLL/.so.
#   uv run emu/build_core.py      (wraps the cmake configure/build below)
cmake_minimum_required(VERSION 3.16)
project(xmen2_gpgx C)

set(GPGX ${CMAKE_CURRENT_SOURCE_DIR}/../gpgx)
set(LRC ${GPGX}/libretro/libretro-common)

set(CORE_DIRS core core/z80 core/m68k core/ntsc core/sound core/input_hw
              core/cd_hw core/cart_hw core/cart_hw/svp core/debug)
set(SRC ${CMAKE_CURRENT_SOURCE_DIR}/xm_trace.c ${GPGX}/libretro/libretro.c)
set(INC ${GPGX}/libretro ${LRC}/include ${GPGX}/libretro/deps/zlib-1.2.11 ${GPGX}/core/sound/minimp3)
foreach(d ${CORE_DIRS})
  file(GLOB s ${GPGX}/${d}/*.c)
  list(APPEND SRC ${s})
  list(APPEND INC ${GPGX}/${d})
endforeach()
list(APPEND SRC
  ${LRC}/streams/file_stream.c ${LRC}/streams/file_stream_transforms.c
  ${LRC}/compat/fopen_utf8.c ${LRC}/compat/compat_snprintf.c ${LRC}/compat/compat_strl.c
  ${LRC}/compat/compat_strcasestr.c ${LRC}/compat/compat_posix_string.c
  ${LRC}/encodings/encoding_utf.c ${LRC}/file/file_path.c ${LRC}/file/retro_dirent.c
  ${LRC}/lists/string_list.c ${LRC}/lists/dir_list.c ${LRC}/memmap/memalign.c
  ${LRC}/string/stdstring.c ${LRC}/vfs/vfs_implementation.c)
file(GLOB ZLIB ${GPGX}/libretro/deps/zlib-1.2.11/*.c)
list(FILTER ZLIB EXCLUDE REGEX "(gz|example|minigzip)")
list(APPEND SRC ${ZLIB})

add_library(xmen2_gpgx SHARED ${SRC})
target_include_directories(xmen2_gpgx PRIVATE ${INC})
target_compile_definitions(xmen2_gpgx PRIVATE
  HOOK_CPU __LIBRETRO__ USE_LIBRETRO_VFS LSB_FIRST BYTE_ORDER=LITTLE_ENDIAN HAVE_ZLIB
  USE_16BPP_RENDERING FRONTEND_SUPPORTS_RGB565 M68K_OVERCLOCK_SHIFT=20 Z80_OVERCLOCK_SHIFT=20
  HAVE_YM3438_CORE HAVE_OPLL_CORE MAXROMSIZE=33554432 HAVE_STDINT_H)
if(MSVC)
  target_compile_definitions(xmen2_gpgx PRIVATE _CRT_SECURE_NO_WARNINGS "INLINE=static __inline")
  target_compile_options(xmen2_gpgx PRIVATE /O2 /W0 /MP)
  set_target_properties(xmen2_gpgx PROPERTIES WINDOWS_EXPORT_ALL_SYMBOLS ON)
else()
  target_compile_definitions(xmen2_gpgx PRIVATE "INLINE=static inline")
  target_compile_options(xmen2_gpgx PRIVATE -O2 -w)
endif()
