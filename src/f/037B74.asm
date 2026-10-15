; ---------------------------------------------------------------------------
; ThronePhone_SetMode - THRONEPHONE slot +$6E (own virtual): set its shape/box fields for mode 0 or 1
; In:  8(a6) = this, $C(a6) = word mode
; Out: d0
; Evidence: tools/classes.py THRONEPHONE +$6E; writes +$93..+$A6 (two value sets); called by ThronePhone_StateCatch with the toggled mode
; ---------------------------------------------------------------------------
ThronePhone_SetMode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d0
	beq.s	loc_037B88
	subq.w	#$1,d0
	beq.s	loc_037BC0
loc_037B88:
	move.b	#$A,$93(a4)
	move.w	#$94,$94(a4)
	move.w	#$E,$96(a4)
	move.w	#$8,$9A(a4)
	move.w	#$B,$9C(a4)
	move.w	#$94,$9E(a4)
	move.w	#$8,$A2(a4)
	move.w	#$D,$A4(a4)
	move.w	#$8,$A6(a4)
	bra.s	loc_037BF6
loc_037BC0:
	move.b	#$A,$93(a4)
	move.w	#$6E,$94(a4)
	move.w	#$7,$96(a4)
	move.w	#$C,$9A(a4)
	move.w	#$B,$9C(a4)
	move.w	#$94,$9E(a4)
	move.w	#$5,$A2(a4)
	move.w	#$B,$A4(a4)
	move.w	#$8,$A6(a4)
loc_037BF6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
