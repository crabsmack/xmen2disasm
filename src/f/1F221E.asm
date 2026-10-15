; ---------------------------------------------------------------------------
; XPlayer_Nop66 - XPLAYER slot +$66: no-op
; In:  8(a6) = player
; Out: none
; Evidence: 6-instruction no-op shared shape
; ---------------------------------------------------------------------------
XPlayer_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
