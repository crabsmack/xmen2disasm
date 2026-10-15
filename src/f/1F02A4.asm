; ---------------------------------------------------------------------------
; XPlayer_AirSpecialDown - XPLAYER slot +$CE: base Down+A in the air = the neutral air special
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = vtable +$C6 and calls it
; ---------------------------------------------------------------------------
XPlayer_AirSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	(a4),a0
	move.l	$C6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$C6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
