; ---------------------------------------------------------------------------
; VDP_InitRegs - program every VDP register with the game's base mode (40-cell, planes, sprite/scroll tables, 64x32 planes)
; In:  none
; Out: none
; Evidence: $8004, reg 1 shadow $8124 (g_VdpReg1), $8238 plane A $E000, $8334 window $D000, $8400 plane B $0000, $8578 sprites $F000, $8D3D H-scroll $F400, $8F02 autoinc 2, $9011 64x32, g_VdpReg11
; ---------------------------------------------------------------------------
VDP_InitRegs:
	link.w	a6,#$0
	move.w	#$8004,($C00004).l
	move.w	#$8124,g_VdpReg1(a5)
	move.w	g_VdpReg1(a5),($C00004).l
	move.w	#$8238,($C00004).l
	move.w	#$8334,($C00004).l
	move.w	#$8400,($C00004).l
	move.w	#$8578,($C00004).l
	move.w	#$8700,($C00004).l
	move.w	#$8A00,($C00004).l
	move.w	g_VdpReg11(a5),($C00004).l
	move.w	#$8C81,($C00004).l
	move.w	#$8D3D,($C00004).l
	move.w	#$8F02,($C00004).l
	move.w	#$9011,($C00004).l
	move.w	#$9100,($C00004).l
	move.w	#$9200,($C00004).l
	move.w	#$9302,($C00004).l
	move.w	#$9400,($C00004).l
	move.w	#$9500,($C00004).l
	move.w	#$9600,($C00004).l
	move.w	#$9700,($C00004).l
	unlk	a6
	rts
