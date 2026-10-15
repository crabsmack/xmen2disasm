; ---------------------------------------------------------------------------
; loc_005EB8
; ---------------------------------------------------------------------------
loc_005EB8:
	addq.w	#$1,-$3B90(a5)
	move.l	a4,g_Player1(a5)
	move.w	#$900,g_P1Health(a5)
	move.l	a3,-$3A1E(a5)
	move.b	#$1,-$3A1A(a5)
	move.w	d7,g_SceneIndex(a5)
	lea.l	sub_006B2C(pc),a0
	move.l	a0,-$38E8(a5)
	lea.l	sub_006B64(pc),a0
	move.l	a0,-$38EC(a5)
	move.b	#$1,-$18AC(a5)
	move.l	d7,d0
	asl.w	#$3,d0
	lea.l	g_SceneTable(a5),a0
	movea.l	$4(a0,d0.w),a1
	jsr	(a1)
	clr.b	-$18AC(a5)
	jsr	$4ACA(a5)	; -> sub_1E2C3E
	tst.b	-$38C6(a5)
	beq.s	loc_005F0C
	ori.w	#$2,-$3C5E(a5)
loc_005F0C:
	jsr	sub_005C7C(pc)
loc_005F10:
	clr.b	-$38C2(a5)
	bra.w	loc_005CF8
