; ---------------------------------------------------------------------------
; Scene_PostLoadVram - scene-load post hook: allocate common sprite VRAM, copy two 16-colour palettes, reserve each player's VRAM tile area
; In:  none
; Out: none
; Evidence: installed in -$38EC, called at the end of scene load sub_1F98A8; Scene_AllocCommonVram; 16 words each to $FFC8A0/$FFC8E0; P1 base -$3BB2 and P2 base -$3BB4 = next tile + Player_CalcMaxTiles each
; ---------------------------------------------------------------------------
Scene_PostLoadVram:
	link.w	a6,#$FFEC
	movem.l	d3/d7/a3-a4,-(a7)
	jsr	Scene_AllocCommonVram(pc)
	lea.l	$3E72(a5),a0
	movea.l	$2(a0),a4
	lea.l	-$3960(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
loc_006B80:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_006B80
	lea.l	$3E7A(a5),a0
	movea.l	$2(a0),a3
	lea.l	-$3920(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_006B9A:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_006B9A
	move.w	-$3598(a5),-$3BB2(a5)
	move.w	-$3BB6(a5),d7
	move.w	d7,d0
	add.w	-$3BB2(a5),d0
	move.w	d0,-$3BB4(a5)
	move.w	d7,d0
	add.w	-$3BB4(a5),d0
	move.w	d0,-$3598(a5)
	jsr	$3DBA(a5)	; -> sub_157BC2
	movem.l	-$24(a6),d3/d7/a3-a4
	unlk	a6
	rts
