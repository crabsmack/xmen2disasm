; ---------------------------------------------------------------------------
; XPlayer_SaveSafePos - XPLAYER slot +$A2: remember the floor segment and position the player stands on as its safe spot
; In:  8(a6) = player
; Out: d0
; Evidence: +$76 segment != 0 -> +$94 = segment, +$98/+$9A = pixel x/y; called every frame by XPlayer_Update; used by XPlayer_PlaceAtSafePos
; ---------------------------------------------------------------------------
XPlayer_SaveSafePos:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$76(a4),a3
	move.l	a3,d0
	beq.s	loc_1F1530
	move.l	a3,$94(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$98(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$9A(a4)
loc_1F1530:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
