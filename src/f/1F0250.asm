; ---------------------------------------------------------------------------
; XPlayer_AirSpecial - XPLAYER slot +$C6: base mid-air special (A button), just air steering then back to control
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: vtable +$8A AirSteer, +$5C = +$A6; XPlayer_StateControl calls +$C6 for A in the air with no direction; characters override
; ---------------------------------------------------------------------------
XPlayer_AirSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
