; ---------------------------------------------------------------------------
; sub_183630	[link-after-rts]
; ---------------------------------------------------------------------------
sub_183630:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$DA(a4)
	cmpi.w	#$701,$68(a4)
	sge.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	pea.l	$C2(a4)
	pea.l	$D8(a4)
	pea.l	$D6(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	sub_18323E(pc)
	move.w	#$3E8,$6A(a4)
	cmpi.w	#$701,$68(a4)
	lea.l	$14(a7),a7
	blt.s	loc_183692
	lea.l	$427A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	bra.s	loc_1836A2
loc_183692:
	lea.l	$4282(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
loc_1836A2:
	move.w	#$FF,$6C(a4)
	lea.l	sub_1835C2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
