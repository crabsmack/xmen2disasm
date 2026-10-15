; ---------------------------------------------------------------------------
; CapedAcolyte_ActShootBurst - CAPEDACOLYTE script action: start a burst of +$B0 shots
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$AE = +$B0; next CapedAcolyte_StateShoot
; ---------------------------------------------------------------------------
CapedAcolyte_ActShootBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$B0(a4),$AE(a4)
	clr.w	$6C(a4)
	lea.l	CapedAcolyte_StateShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
