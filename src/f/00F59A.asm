; ---------------------------------------------------------------------------
; AvalonB1_InitIntroPalette - set palette line 0 of g_PalBase to the AvalonB1 intro colours and copy 16 level colours into line 2
; In:  none
; Out: none
; Evidence: writes $FFC880.. (g_PalBase) constants, copies 16 words from the level palette resource (+$10 offset) to $FFC8C0, sets g_PalBaseDirty; called from AvalonB1_CamHookWait2
; ---------------------------------------------------------------------------
AvalonB1_InitIntroPalette:
	link.w	a6,#$FFFC
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	g_PalBase(a5),a4
	lea.l	$92(a5),a0
	move.l	$2(a0),-$4(a6)
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	move.w	#$200,(a4)+
	move.w	#$220,(a4)+
	move.w	#$E0,(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	clr.w	(a4)+
	move.w	#$20,(a4)+
	move.w	#$28,(a4)+
	move.l	-$4(a6),d7
	movea.l	d7,a0
	moveq	#$0,d0
	move.w	$10(a0),d0
	tst.l	d0
	movea.l	d0,a3
	adda.l	d7,a3
	lea.l	-$3940(a5),a4
	clr.w	d7
	moveq	#$10,d3
loc_00F5F4:
	move.w	(a3)+,(a4)+
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_00F5F4
	move.b	#$1,g_PalBaseDirty(a5)
	movem.l	-$14(a6),d3/d7/a3-a4
	unlk	a6
	rts
