; ---------------------------------------------------------------------------
; SavageJungle_PalPhaseUpdate_Case1 - SavageJungle_PalPhaseUpdate later case: next palette step
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
SavageJungle_PalPhaseUpdate_Case1:
	movea.l	-$3C1A(a5),a0
	move.w	$8(a0),-$3C1E(a5)
	move.w	#$200,-$393C(a5)
	move.w	#$400,-$393A(a5)
	move.w	#$602,-$3938(a5)
	move.w	#$804,-$3936(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF95E:
	movea.l	-$3C1A(a5),a0
	move.w	$A(a0),-$3C1E(a5)
	move.w	#$200,-$393C(a5)
	move.w	#$402,-$393A(a5)
	move.w	#$604,-$3938(a5)
	move.w	#$806,-$3936(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF982:
	movea.l	-$3C1A(a5),a0
	move.w	$C(a0),-$3C1E(a5)
	move.w	#$402,-$393C(a5)
	move.w	#$404,-$393A(a5)
	move.w	#$606,-$3938(a5)
	move.w	#$808,-$3936(a5)
	bra.s	SavageJungle_PalPhaseUpdate_Done
loc_0BF9A6:
	movea.l	-$3C1A(a5),a0
	move.w	$E(a0),-$3C1E(a5)
	move.w	#$404,-$393C(a5)
	move.w	#$426,-$393A(a5)
	move.w	#$608,-$3938(a5)
	move.w	#$82A,-$3936(a5)
