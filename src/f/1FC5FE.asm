; ---------------------------------------------------------------------------
; sub_1FC5FE	[jt 2578]
; ---------------------------------------------------------------------------
sub_1FC5FE:
	link.w	a6,#$0
	tst.l	-$CA6(a5)
	bne.s	loc_1FC64A
	pea.l	$1FC6BE(pc)
	pea.l	($DC0).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	addq.w	#$8,a7
	movea.l	d0,a0
	move.l	a0,-$CA6(a5)
	lea.l	(a0),a1
	move.l	a1,-$BF0(a5)
	lea.l	$280(a0),a1
	move.l	a1,-$BEC(a5)
	lea.l	$500(a0),a1
	move.l	a1,-$BE8(a5)
	lea.l	$780(a0),a1
	move.l	a1,-$BE4(a5)
	lea.l	$A00(a0),a1
	move.l	a1,-$BE0(a5)
	lea.l	$C80(a0),a1
	move.l	a1,-$BDC(a5)
loc_1FC64A:
	move.l	$8(a6),d0
	beq.s	loc_1FC666
	lea.l	-$C96(a5),a1
	cmpa.l	d0,a1
	beq.s	loc_1FC666
	movea.l	a1,a1
	movea.l	d0,a0
	moveq	#$8,d0
loc_1FC65E:
	move.l	(a0)+,(a1)+
	dbra	d0,loc_1FC65E
	move.w	(a0)+,(a1)+
loc_1FC666:
	move.l	$C(a6),-$C70(a5)
	move.l	$10(a6),-$C6C(a5)
	move.l	$14(a6),-$C68(a5)
	move.w	$1A(a6),-$C64(a5)
	sf.b	-$C62(a5)
	sf.b	-$C61(a5)
	tst.l	-$C70(a5)
	beq.s	loc_1FC6A2
	tst.l	-$C6C(a5)
	bne.s	loc_1FC698
	st.b	-$C62(a5)
	bra.s	loc_1FC6A8
loc_1FC698:
	jsr	sub_1FC1CC(pc)
	clr.l	-$C70(a5)
	bra.s	loc_1FC6A8
loc_1FC6A2:
	tst.l	-$C6C(a5)
	beq.s	loc_1FC6AC
loc_1FC6A8:
	st.b	-$C61(a5)
loc_1FC6AC:
	suba.l	a0,a0
	tst.b	-$C61(a5)
	beq.s	loc_1FC6B8
	lea.l	-$C96(a5),a0
loc_1FC6B8:
	move.l	a0,d0
	unlk	a6
	rts
