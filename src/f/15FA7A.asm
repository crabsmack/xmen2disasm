; ---------------------------------------------------------------------------
; sub_15FA7A	[jt 2084]
; ---------------------------------------------------------------------------
sub_15FA7A:
	link.w	a6,#$FFFC
	movem.l	d6-d7/a2-a4,-(a7)
	move.l	g_VBlankHook(a5),-$4(a6)
	lea.l	$50EA(a5),a0
	move.l	a0,g_VBlankHook(a5)
	sf.b	g_PalBaseDirty(a5)
	lea.l	g_PalBase(a5),a4
	move.w	$E(a6),d0
	lsl.w	#$5,d0
	adda.w	d0,a4
	movea.l	a4,a0
	moveq	#$0,d0
	moveq	#$7,d1
loc_15FAA6:
	move.l	d0,(a0)+
	dbra	d1,loc_15FAA6
	lea.l	$15FBBE(pc),a3
loc_15FAB0:
	movea.l	a3,a0
	lea.l	$4(a4),a1
	moveq	#$8,d6
loc_15FAB8:
	move.w	(a0)+,d0
	bmi.s	loc_15FAC2
	move.w	d0,(a1)+
	dbra	d6,loc_15FAB8
loc_15FAC2:
	st.b	g_PalBaseDirty(a5)
	moveq	#$3,d7
loc_15FAC8:
	bsr.w	sub_15FBAE
	dbra	d7,loc_15FAC8
	addq.w	#$2,a3
	tst.w	(a3)
	bpl.s	loc_15FAB0
	moveq	#$A,d7
loc_15FAD8:
	bsr.w	sub_15FBAE
	dbra	d7,loc_15FAD8
	lea.l	$15FBEC(pc),a3
loc_15FAE4:
	lea.l	$4(a4),a1
	moveq	#$8,d6
	move.w	(a3)+,d0
loc_15FAEC:
	move.w	d0,(a1)+
	dbra	d6,loc_15FAEC
	cmpi.w	#$EEE,(a3)
	bne.s	loc_15FAFE
	move.w	#$EEE,$2(a4)
loc_15FAFE:
	st.b	g_PalBaseDirty(a5)
	moveq	#$1,d7
loc_15FB04:
	bsr.w	sub_15FBAE
	dbra	d7,loc_15FB04
	tst.w	(a3)
	bpl.s	loc_15FAE4
	moveq	#$6,d7
loc_15FB12:
	bsr.w	sub_15FBAE
	dbra	d7,loc_15FB12
	lea.l	$15FC0A(pc),a3
loc_15FB1E:
	movea.l	a3,a0
	lea.l	$4(a4),a1
	moveq	#$8,d6
loc_15FB26:
	move.w	(a0)+,d0
	bmi.s	loc_15FB30
	move.w	d0,(a1)+
	dbra	d6,loc_15FB26
loc_15FB30:
	st.b	g_PalBaseDirty(a5)
	moveq	#$4,d7
loc_15FB36:
	bsr.w	sub_15FBAE
	move.w	g_Pad1Raw(a5),d0
	or.w	g_Pad2Raw(a5),d0
	andi.w	#$F0,d0
	bne.s	loc_15FB8A
	dbra	d7,loc_15FB36
	addq.w	#$2,a3
	tst.w	(a3)
	bpl.s	loc_15FB1E
	lea.l	$15FC26(pc),a3
loc_15FB56:
	movea.l	a3,a0
	lea.l	$4(a4),a1
	moveq	#$8,d6
loc_15FB5E:
	move.w	(a0)+,d0
	bmi.s	loc_15FB68
	move.w	d0,(a1)+
	dbra	d6,loc_15FB5E
loc_15FB68:
	st.b	g_PalBaseDirty(a5)
	moveq	#$4,d7
loc_15FB6E:
	bsr.w	sub_15FBAE
	move.w	g_Pad1Raw(a5),d0
	or.w	g_Pad2Raw(a5),d0
	andi.w	#$F0,d0
	bne.s	loc_15FB8A
	dbra	d7,loc_15FB6E
	addq.w	#$2,a3
	tst.w	(a3)
	bpl.s	loc_15FB56
loc_15FB8A:
	movea.l	a4,a0
	moveq	#$0,d0
	moveq	#$7,d1
loc_15FB90:
	move.l	d0,(a0)+
	dbra	d1,loc_15FB90
	st.b	g_PalBaseDirty(a5)
	bsr.w	sub_15FBAE
	move.l	-$4(a6),g_VBlankHook(a5)
	movem.l	-$18(a6),d6-d7/a2-a4
	unlk	a6
	rts
