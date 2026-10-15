; ---------------------------------------------------------------------------
; BigAcolyte_StateWaitYShoot - BIGACOLYTE state: poll every 4 frames until the vertical target is reached, then shoot
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A7 arrived -> BigAcolyte_StateShootAnim
; ---------------------------------------------------------------------------
BigAcolyte_StateWaitYShoot:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$A7(a4)
	beq.s	loc_0113CA
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateShootAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0113DE
loc_0113CA:
	move.w	#$4,$6C(a4)
	lea.l	BigAcolyte_StateWaitYShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0113DE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
