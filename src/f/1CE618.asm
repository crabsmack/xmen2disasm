; ---------------------------------------------------------------------------
; Magneto_GroundAttack - MAGNETO slot +$D2: B on the ground: stop and aim
; In:  8(a6) = player
; Out: none
; Evidence: +$10 = 0 (standing), velocity 0, state Magneto_StateAim
; ---------------------------------------------------------------------------
Magneto_GroundAttack:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$10(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	Magneto_StateAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StateAim(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
