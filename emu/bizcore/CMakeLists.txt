# BizHawk 2.4's Genesis Plus GX fork (the core the TAS syncs on) + xm_biz glue.
# Sources are fetched by emu/build_core.py into emu/_src/bizhawk-2.4 (not vendored).
cmake_minimum_required(VERSION 3.16)
project(xmen2_bizgpgx C)

set(G ${CMAKE_CURRENT_SOURCE_DIR}/../_src/bizhawk-2.4/waterbox/gpgx)
file(GLOB_RECURSE SRC ${G}/core/*.c ${G}/util/*.c ${G}/cinterface/*.c)
list(APPEND SRC ${CMAKE_CURRENT_SOURCE_DIR}/xm_biz.c)
add_library(xmen2_bizgpgx SHARED ${SRC})
target_include_directories(xmen2_bizgpgx PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
  ${G}/core ${G}/util ${G}/cinterface ${G}/core/m68k ${G}/core/z80 ${G}/core/input_hw
  ${G}/core/cart_hw ${G}/core/cart_hw/svp ${G}/core/sound ${G}/core/ntsc ${G}/core/cd_hw)
target_compile_definitions(xmen2_bizgpgx PRIVATE LSB_FIRST USE_32BPP_RENDERING
  _CRT_SECURE_NO_WARNINGS "INLINE=static __inline")
target_compile_options(xmen2_bizgpgx PRIVATE /O2 /W0 /MP)
