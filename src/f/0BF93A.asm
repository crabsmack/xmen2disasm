; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Case1 - SavageJungle_PalPhaseUpdate later case: next palette step
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Case1:
	movea.l	g_JunglePalScript(a5),a0
	move.w	$8(a0),g_JunglePalTimer(a5)
	move.w	#$200,g_PalBase+$44(a5)
	move.w	#$400,g_PalBase+$46(a5)
	move.w	#$602,g_PalBase+$48(a5)
	move.w	#$804,g_PalBase+$4A(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF95E:
	movea.l	g_JunglePalScript(a5),a0
	move.w	$A(a0),g_JunglePalTimer(a5)
	move.w	#$200,g_PalBase+$44(a5)
	move.w	#$402,g_PalBase+$46(a5)
	move.w	#$604,g_PalBase+$48(a5)
	move.w	#$806,g_PalBase+$4A(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF982:
	movea.l	g_JunglePalScript(a5),a0
	move.w	$C(a0),g_JunglePalTimer(a5)
	move.w	#$402,g_PalBase+$44(a5)
	move.w	#$404,g_PalBase+$46(a5)
	move.w	#$606,g_PalBase+$48(a5)
	move.w	#$808,g_PalBase+$4A(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF9A6:
	movea.l	g_JunglePalScript(a5),a0
	move.w	$E(a0),g_JunglePalTimer(a5)
	move.w	#$404,g_PalBase+$44(a5)
	move.w	#$426,g_PalBase+$46(a5)
	move.w	#$608,g_PalBase+$48(a5)
	move.w	#$82A,g_PalBase+$4A(a5)
