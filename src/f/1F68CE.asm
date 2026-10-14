; ---------------------------------------------------------------------------
; sub_1F68CE	[jt 2511]
; ---------------------------------------------------------------------------
sub_1F68CE:
	link.w	a6,#$0
	clr.b	-$3A06(a5)
	jsr	sub_1F6816(pc)
	jsr	sub_1F68B2(pc)
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	sub_1F67C8(pc)
	lea.l	$10(a7),a7
	bra.s	loc_1F6900
loc_1F68FC:
	jsr	$5112(a5)	; -> sub_1FDC5C
loc_1F6900:
	tst.b	-$3A02(a5)
	bne.s	loc_1F68FC
	jsr	sub_1F6886(pc)
	unlk	a6
	rts
