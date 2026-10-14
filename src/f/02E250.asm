; ---------------------------------------------------------------------------
; sub_02E250	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02E250:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$16000,$8(a4)
	ble.s	loc_02E27A
	jsr	$66A(a5)	; -> sub_02DC80
	clr.w	$6C(a4)
	lea.l	sub_02E2E6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02E27A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
