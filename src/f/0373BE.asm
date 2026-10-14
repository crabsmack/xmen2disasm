; ---------------------------------------------------------------------------
; sub_0373BE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0373BE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	cmpi.l	#$490,d0
	ble.s	loc_0373F6
	moveq	#$25,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0368D0(pc)
	addq.w	#$8,a7
	move.w	#$5,$6C(a4)
	lea.l	sub_0373FE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0373F6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
