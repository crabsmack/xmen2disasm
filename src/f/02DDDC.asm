; ---------------------------------------------------------------------------
; Exodus_CheckFloorHit - when a downward blast hit floor segment A or B: disable it, drop players standing on it and break its tiles
; In:  none
; Out: none
; Evidence: Exodus object at g_ExodusObj; +$A2 hit segment vs +$A0/+$A1; segment records at g_Segs + n*$14 (flag $40, +$10/+$11 = $FF); Exodus_DropPlayerFromSeg, Exodus_BreakFloorTiles
; ---------------------------------------------------------------------------
Exodus_CheckFloorHit:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	tst.l	g_ExodusObj(a5)
	beq.w	loc_02DEAA
	movea.l	g_ExodusObj(a5),a0
	move.b	$A2(a0),d7
	beq.w	loc_02DEAA
	moveq	#$0,d0
	move.b	$A0(a0),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	movea.l	g_ExodusObj(a5),a0
	moveq	#$0,d0
	move.b	$A1(a0),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	movea.l	g_ExodusObj(a5),a0
	cmp.b	$A0(a0),d7
	bne.s	loc_02DE68
	ori.b	#$40,(a3)
	move.b	#$FF,$11(a3)
	move.b	#$FF,$10(a4)
	move.l	a3,-(a7)
	pea.l	g_Player1(a5)
	jsr	Exodus_DropPlayerFromSeg(pc)
	move.l	a3,-(a7)
	pea.l	g_Player2(a5)
	jsr	Exodus_DropPlayerFromSeg(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	Exodus_BreakFloorTiles(pc)
	lea.l	$14(a7),a7
	bra.s	loc_02DEA2
loc_02DE68:
	movea.l	g_ExodusObj(a5),a0
	cmp.b	$A1(a0),d7
	bne.s	loc_02DEA2
	ori.b	#$40,(a4)
	move.b	#$FF,$10(a4)
	move.b	#$FF,$11(a3)
	move.l	a4,-(a7)
	pea.l	g_Player1(a5)
	jsr	Exodus_DropPlayerFromSeg(pc)
	move.l	a4,-(a7)
	pea.l	g_Player2(a5)
	jsr	Exodus_DropPlayerFromSeg(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	Exodus_BreakFloorTiles(pc)
	lea.l	$14(a7),a7
loc_02DEA2:
	movea.l	g_ExodusObj(a5),a0
	clr.b	$A2(a0)
loc_02DEAA:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
