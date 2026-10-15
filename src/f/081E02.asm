; ---------------------------------------------------------------------------
; CloneA2_LoadLevel - load the CloneA2 level: map/layout via Level_Load with Tbl_CloneA2ClassList, initial palettes
; In:  none
; Out: none
; Evidence: passes jt[541]/jt[542] data, Tbl_CloneA2ClassList and layout constants to Level_Load; copies 16 words jt[545] -> palette line 2 (g_PalBase+$40) and jt[544] -> line 0 (g_PalBase); palette colour 0 := $200, -$38B4 := 1, g_TwoPlayerStep := 0; second step of CloneA2_RunScene; TAS frame 47751
; ---------------------------------------------------------------------------
CloneA2_LoadLevel:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$111A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$110A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$1112(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1112(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	move.w	#$200,g_PalBase(a5)
	lea.l	$112A(a5),a0
	movea.l	$2(a0),a4
	lea.l	-$3940(a5),a3
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$40(a7),a7
loc_081E6E:
	move.w	(a4)+,(a3)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_081E6E
	lea.l	$1122(a5),a0
	movea.l	$2(a0),a3
	lea.l	g_PalBase(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_081E88:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_081E88
	move.b	#$1,-$38B4(a5)
	clr.b	g_TwoPlayerStep(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
