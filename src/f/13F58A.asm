; ---------------------------------------------------------------------------
; sub_13F58A	[jt 1897]
; ---------------------------------------------------------------------------
sub_13F58A:
	link.w	a6,#$FFE4
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$16(a6),d4
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	movea.l	$10(a6),a3
	lea.l	$C(a3),a0
	move.l	a0,-$4(a6)
	clr.w	d7
	bra.w	loc_13F718
loc_13F5B0:
	move.b	(a3),d0
	cmp.b	$1(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13F5D6
	move.b	(a3),d0
	addq.b	#$1,(a3)
	ext.w	d0
	ext.l	d0
	movea.l	-$4(a6),a0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	adda.l	d0,a0
	move.l	a0,d0
	bra.s	loc_13F5D8
loc_13F5D6:
	moveq	#$0,d0
loc_13F5D8:
	movea.l	d0,a4
	move.l	a4,d0
	beq.w	loc_13F71E
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-$8(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$C(a6),d0
	sub.l	d1,d0
	move.l	-$8(a6),d1
	add.l	d1,d0
	move.l	d0,(a4)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-$10(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$14(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$14(a6),d0
	sub.l	d1,d0
	move.l	-$10(a6),d1
	add.l	d1,d0
	move.l	d0,$4(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$7FF,d0
	and.w	d1,d0
	move.l	d0,-$18(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$7FF,d0
	and.w	d1,d0
	move.l	-$18(a6),d1
	sub.w	d0,d1
	move.w	d1,$8(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	move.l	d0,-$1C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	move.l	-$1C(a6),d1
	sub.w	d0,d1
	move.w	d1,$A(a4)
	tst.w	$8(a4)
	ble.s	loc_13F6C4
	move.w	#$2,$C(a4)
	bra.s	loc_13F6CA
loc_13F6C4:
	move.w	#$FFFE,$C(a4)
loc_13F6CA:
	move.w	#$20,$E(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d0
	and.w	d1,d0
	move.b	d0,$10(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1,d0
	and.w	d1,d0
	move.b	d0,$11(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d0
	and.w	d1,d0
	addq.b	#$4,d0
	move.b	d0,$12(a4)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$FF,d0
	and.w	d1,d0
	move.b	d0,$13(a4)
	move.w	d7,d0
	addq.w	#$1,d7
loc_13F718:
	cmp.w	d7,d4
	bgt.w	loc_13F5B0
loc_13F71E:
	movem.l	-$38(a6),d3-d7/a3-a4
	unlk	a6
	rts
