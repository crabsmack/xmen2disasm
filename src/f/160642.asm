; ---------------------------------------------------------------------------
; sub_160642	[jt 2094]
; ---------------------------------------------------------------------------
sub_160642:
	link.w	a6,#$0
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-$3A14(a5)
	jsr	$4D92(a5)	; -> sub_1F4890
	moveq	#$0,d7
	tst.l	d7
	beq.s	loc_160676
	lea.l	$5122(a5),a0
	move.l	a0,-$3A14(a5)
	lea.l	$512A(a5),a0
	move.l	a0,-$3A14(a5)
	lea.l	$51C2(a5),a0
	move.l	a0,-$3A14(a5)
	moveq	#$0,d0
	move.l	d0,-$3A14(a5)
loc_160676:
	move.l	#$FF0000,-$348C(a5)
	jsr	$4DA2(a5)	; -> sub_1F4854
	tst.b	-$202(a5)
	beq.s	loc_160690
	move.w	#$8B08,-$204(a5)
	bra.s	loc_160696
loc_160690:
	move.w	#$8B00,-$204(a5)
loc_160696:
	jsr	sub_160594(pc)
	tst.b	-$202(a5)
	beq.s	loc_1606A8
	dc.w	$13FC,$FF80,$00A1,$000D	; insn: move.b #$80, $a1000d.l
loc_1606A8:
	jsr	$50D2(a5)	; -> sub_1FD720
	moveq	#$0,d0
	move.l	d0,-$3A10(a5)
	jsr	$51CA(a5)	; -> sub_1FE05C
loc_1606B6:
	moveq	#$2,d0
	and.w	($C00004).l,d0
	bne.s	loc_1606B6
	jsr	$5192(a5)	; -> sub_1FDFE8
	jsr	$5182(a5)	; -> sub_1FDF6C
	jsr	$518A(a5)	; -> sub_1FDFCE
	ori.w	#$20,-$1D48(a5)
	move.w	-$1D48(a5),($C00004).l
	ori.w	#$40,-$1D48(a5)
	move.w	-$1D48(a5),($C00004).l
	jsr	$4E02(a5)	; -> sub_1F5254
	move.l	-$4(a6),d7
	unlk	a6
	rts
