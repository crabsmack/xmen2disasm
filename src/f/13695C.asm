; ---------------------------------------------------------------------------
; Hornet_MoveDiveOnce - Hornet motion, pattern 2: dive with bouncing until y > $171, then hover 20 frames and rise away
; In:  8(a6) = this
; Out: none
; Evidence: Hornet_MoveBounce, then at y px > $171: +$6E = 20, +$94 = Hornet_MoveWaitThenRiseLeave; chosen by Hornet_StatePickPattern for +$9E = 2
; ---------------------------------------------------------------------------
Hornet_MoveDiveOnce:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Hornet_MoveBounce(pc)
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	blt.s	loc_136988
	move.w	#$14,$6E(a4)
	lea.l	Hornet_MoveWaitThenRiseLeave(pc),a0
	move.l	a0,$94(a4)
loc_136988:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
