; ---------------------------------------------------------------------------
; BaniMazaA1_InitPalette - set BaniMazaA1 palette line 3 and a few line-2 colours
; In:  none
; Out: none
; Evidence: 16 colours from jt $525CE+4 into $FFC8E0; $FFC8CA/$CE/$D2/$DC constants; g_PalBase[0] = 0
; ---------------------------------------------------------------------------
BaniMazaA1_InitPalette:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$C32(a5),a0
	movea.l	$2(a0),a3
	addq.w	#$4,a3
	lea.l	g_PalBase+$60(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_038ABE:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_038ABE
	clr.w	g_PalBase(a5)
	move.w	#$68,g_PalBase+$4A(a5)
	move.w	#$4AC,g_PalBase+$4E(a5)
	move.w	#$ACE,g_PalBase+$52(a5)
	move.w	#$22,g_PalBase+$5C(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
