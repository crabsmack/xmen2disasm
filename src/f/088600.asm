; ---------------------------------------------------------------------------
; CloneA5_SpawnBoss - CloneA5: create the BROODBOSS from its placement entry
; In:  none
; Out: none
; Evidence: walks the 16-byte placements ($FFC92A, count $FFC928); class index word 0 into the class list g_ClassList; Tbl_BroodBoss_vtable +$0E New at placement x/y; TAS 49283
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_SpawnBoss:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	g_PlacementList(a5),a4
	clr.w	d7
	bra.s	loc_088664
loc_088610:
	move.w	(a4),d0
	ext.l	d0
	movea.l	g_ClassList(a5),a0
	asl.l	#$2,d0
	lea.l	$150A(a5),a1
	move.l	$2(a0,d0.l),d0
	cmp.l	$2(a1),d0
	bne.s	loc_08865C
	move.l	a4,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	$2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	lea.l	$150A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$150A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	lea.l	$14(a7),a7
loc_08865C:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$10(a4),a4
loc_088664:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	g_SpawnRecCount(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_088610
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
