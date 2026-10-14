; ---------------------------------------------------------------------------
; sub_081EA6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_081EA6:
	link.w	a6,#$0
	lea.l	$3F22(a5),a0
	move.l	a0,-$3402(a5)
	lea.l	sub_081D08(pc),a0
	move.l	a0,-$388E(a5)
	jsr	sub_081DD2(pc)
	jsr	sub_081BC2(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> sub_006BD0
	unlk	a6
	rts
