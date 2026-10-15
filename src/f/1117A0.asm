; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode - Deathbird slot 27 (+$72): pick a movement mode 0-10 (velocity, gravity, entry side, animation; byte +$AE = Deathbird_Move kind)
; In:  8(a6) = this  $E(a6) = word mode
; Out: none
; Evidence: switch Sw_1117A0; Obj_ChangeAnim; modes used by the Deathbird states (1 = fall when dead, 4 = fly off, 6 = re-enter, 9 = to the switch)
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d0
	bmi.w	Deathbird_SetMoveMode_Default
	cmpi.w	#$A,d0
	bgt.w	Deathbird_SetMoveMode_Default
	add.w	d0,d0
	move.w	Sw_1117A0(pc,d0.w),d0
	jmp	Sw_1117A0-2(pc,d0.w)
