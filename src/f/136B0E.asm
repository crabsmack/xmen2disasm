; ---------------------------------------------------------------------------
; Hornet_MoveDiveRepeat - Hornet motion, pattern 3 first dive: dive until y > $171, then hover 10 frames and start the rise/dive loop
; In:  8(a6) = this
; Out: none
; Evidence: same body as Hornet_MoveDiveAgain; chosen by Hornet_StatePickPattern for +$9E = 3 (vy = $300)
; ---------------------------------------------------------------------------
Hornet_MoveDiveRepeat:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Hornet_MoveBounce(pc)
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	blt.s	loc_136B3A
	move.w	#$A,$6E(a4)
	lea.l	Hornet_MoveWaitThenRise(pc),a0
	move.l	a0,$94(a4)
loc_136B3A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
