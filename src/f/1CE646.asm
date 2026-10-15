; ---------------------------------------------------------------------------
; Magneto_GroundAttackUp - MAGNETO slot +$D6: Up+B on the ground: stop and aim (same as B)
; In:  8(a6) = player
; Out: none
; Evidence: identical body to Magneto_GroundAttack
; ---------------------------------------------------------------------------
Magneto_GroundAttackUp:
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
