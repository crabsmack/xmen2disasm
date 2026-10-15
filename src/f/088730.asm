; ---------------------------------------------------------------------------
; sub_088730	[jt 644]
; ---------------------------------------------------------------------------
sub_088730:
	link.w	a6,#$FCFC
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$1532(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1522(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1512(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$151A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$151A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1112(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$152A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$13,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$A,d0
	move.l	d0,-(a7)
	moveq	#$48,d1
	move.l	d1,-(a7)
	pea.l	-$2D0(a6)
	jsr	$2E2A(a5)	; -> ICandy_PoolInit
	move.b	#$1,-$38B4(a5)
	clr.w	-$3492(a5)
	move.w	#$100,-$3494(a5)
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	moveq	#$0,d0
	move.l	d0,-$3C44(a5)
	move.l	#$3300,-$3C48(a5)
	clr.w	-$34A0(a5)
	jsr	sub_0884D2(pc)
	lea.l	-$304(a6),a0
	move.l	a0,-$3B18(a5)
	move.b	#$5,-$3C4A(a5)
	moveq	#$33,d7
	lea.l	$14D2(a5),a0
	movea.l	$2(a0),a4
	lea.l	$54(a7),a7
	bra.s	loc_08880A
loc_088800:
	movea.l	-$3B18(a5),a0
	addq.l	#$1,-$3B18(a5)
	move.b	(a4)+,(a0)
loc_08880A:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d0
	bge.s	loc_088800
	lea.l	-$304(a6),a0
	move.l	a0,-$3B18(a5)
	lea.l	sub_08803A(pc),a0
	move.l	a0,-$3412(a5)
	lea.l	sub_088044(pc),a0
	move.l	a0,-$3416(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$12,d1
	move.l	d1,-(a7)
	jsr	$3B62(a5)	; -> sub_13F4D4
	move.l	d0,-$3B1C(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$12,d1
	move.l	d1,-(a7)
	jsr	$3B62(a5)	; -> sub_13F4D4
	move.l	d0,-$3B14(a5)
	clr.b	-$3894(a5)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$28(a7),a7
	bne.s	loc_0888AA
	ori.b	#$4,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_0888AA:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0888F0
	ori.b	#$4,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_0888F0:
	jsr	sub_0883C2(pc)
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$3382(a5)	; -> sub_11F1A6
	move.w	#$200,g_PalBase(a5)
	lea.l	$1122(a5),a0
	movea.l	$2(a0),a4
	lea.l	g_PalBase(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
	addq.w	#$4,a7
loc_088914:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_088914
	clr.w	-$3B0C(a5)
	clr.w	-$3B0E(a5)
	jsr	sub_0883AE(pc)
	move.b	d0,-$35C8(a5)
	jsr	sub_08869E(pc)
	lea.l	sub_0884E6(pc),a0
	move.l	a0,-$388E(a5)
	clr.b	-$38DE(a5)
	jsr	$5002(a5)	; -> sub_1FA6FE
	movem.l	-$314(a6),d3/d7/a3-a4
	unlk	a6
	rts
