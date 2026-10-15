; ---------------------------------------------------------------------------
; Hornet_MoveDiveAgain - Hornet motion, pattern 3 loop: dive until y > $171, then hover 10 frames and rise again
; In:  8(a6) = this
; Out: none
; Evidence: Hornet_MoveBounce, at y px > $171: +$6E = 10, +$94 = Hornet_MoveWaitThenRise; set by Hornet_MoveWaitThenDive (same body as Hornet_MoveDiveRepeat)
; ---------------------------------------------------------------------------
Hornet_MoveDiveAgain:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	Hornet_MoveBounce(pc)
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmpi.w	#$172,d7
	blt.s	loc_1369BE
	move.w	#$A,$6E(a4)
	lea.l	Hornet_MoveWaitThenRise(pc),a0
	move.l	a0,$94(a4)
loc_1369BE:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
