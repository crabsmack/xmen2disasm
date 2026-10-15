; ---------------------------------------------------------------------------
; XPlayer_GroundSpecialDown - XPLAYER slot +$E2: base Down+A on the ground = the neutral ground special
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = vtable +$DE and calls it
; ---------------------------------------------------------------------------
XPlayer_GroundSpecialDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	(a4),a0
	move.l	$DE(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$DE(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
