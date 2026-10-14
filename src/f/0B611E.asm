; ---------------------------------------------------------------------------
; sub_0B611E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B611E:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4E22(a5)	; -> sub_1F5F40
	moveq	#$13,d0
	move.l	d0,-(a7)
	jsr	$4E2A(a5)	; -> sub_1F5F5A
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	jsr	sub_0B60BE(pc)
	tst.b	-$3A02(a5)
	addq.w	#$8,a7
	bne.s	loc_0B6152
	jsr	sub_0B602A(pc)
loc_0B6152:
	tst.b	-$38DE(a5)
	beq.s	loc_0B616E
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	jsr	sub_0B60BE(pc)
	tst.b	-$3A02(a5)
	bne.s	loc_0B616E
	jsr	sub_0B602A(pc)
loc_0B616E:
	moveq	#$8,d0
	cmp.w	-$3B02(a5),d0
	blt.s	loc_0B6192
	move.l	-$35A2(a5),d0
	btst	#$0,d0
	beq.s	loc_0B618A
	lea.l	$1DCA(a5),a0
	movea.l	$2(a0),a4
	bra.s	loc_0B6192
loc_0B618A:
	lea.l	$1DD2(a5),a0
	movea.l	$2(a0),a4
loc_0B6192:
	move.w	-$3B02(a5),d0
	cmp.w	-$3B04(a5),d0
	beq.w	loc_0B6224
	moveq	#$10,d0
	cmp.w	-$3B02(a5),d0
	blt.s	loc_0B61C0
	moveq	#$10,d0
	cmp.w	-$3B04(a5),d0
	bge.s	loc_0B61C0
	lea.l	$1DDA(a5),a0
	movea.l	$2(a0),a4
	addi.l	#$80,-$3B24(a5)
	bra.s	loc_0B6224
loc_0B61C0:
	moveq	#$18,d0
	cmp.w	-$3B02(a5),d0
	blt.s	loc_0B61E2
	moveq	#$18,d0
	cmp.w	-$3B04(a5),d0
	bge.s	loc_0B61E2
	lea.l	$1DE2(a5),a0
	movea.l	$2(a0),a4
	addi.l	#$80,-$3B24(a5)
	bra.s	loc_0B6224
loc_0B61E2:
	moveq	#$20,d0
	cmp.w	-$3B02(a5),d0
	blt.s	loc_0B6204
	moveq	#$20,d0
	cmp.w	-$3B04(a5),d0
	bge.s	loc_0B6204
	lea.l	$1DEA(a5),a0
	movea.l	$2(a0),a4
	addi.l	#$80,-$3B24(a5)
	bra.s	loc_0B6224
loc_0B6204:
	moveq	#$28,d0
	cmp.w	-$3B02(a5),d0
	blt.s	loc_0B6224
	moveq	#$28,d0
	cmp.w	-$3B04(a5),d0
	bge.s	loc_0B6224
	lea.l	$1DF2(a5),a0
	movea.l	$2(a0),a4
	addi.l	#$80,-$3B24(a5)
loc_0B6224:
	move.l	a4,d0
	beq.s	loc_0B6242
	lea.l	-$3910(a5),a3
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.w	(a4)+,(a3)+
	move.b	#$1,-$3A06(a5)
loc_0B6242:
	move.w	-$3B02(a5),-$3B04(a5)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
