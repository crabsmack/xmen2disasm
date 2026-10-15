; ---------------------------------------------------------------------------
; XPlayer_DoubleJumpNone - XPLAYER slot +$B6: base double jump, none: go back to the control state
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: +$6C = 0, +$5C = vtable +$A6 (XPlayer_StateControl)
; ---------------------------------------------------------------------------
XPlayer_DoubleJumpNone:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
