; ---------------------------------------------------------------------------
; sub_13536A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13536A:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d6
	sub.l	$8(a4),d6
	move.w	$54(a3),d0
	ext.l	d0
	addq.l	#$6,d0
	move.l	d0,d4
	lsl.l	#$8,d4
	move.l	d4,d0
	sub.l	$C(a4),d0
	move.l	d0,-$4(a6)
	move.w	$AA(a4),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1353AC
	move.l	d6,d0
	bra.s	loc_1353B0
loc_1353AC:
	move.l	d6,d0
	neg.l	d0
loc_1353B0:
	tst.w	d7
	beq.s	loc_1353B8
	move.w	d7,d1
	bra.s	loc_1353BC
loc_1353B8:
	move.w	#$200,d1
loc_1353BC:
	ext.l	d1
	jsr	$3FA2(a5)	; -> sub_15C222
	move.l	d0,d5
	beq.s	loc_1353CA
	move.l	d5,d0
	bra.s	loc_1353CC
loc_1353CA:
	moveq	#$1,d0
loc_1353CC:
	move.l	d0,d1
	move.l	-$4(a6),d0
	jsr	$3FA2(a5)	; -> sub_15C222
	move.w	d0,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$4,a7
	beq.s	loc_1353EA
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_1353EA:
	move.w	d7,$16(a4)
	move.w	d6,$18(a4)
	moveq	#$0,d0
	move.b	-$3B5C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_135410
	lea.l	$36C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	bra.s	loc_135420
loc_135410:
	lea.l	$36D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
loc_135420:
	lea.l	sub_1347F8(pc),a0
	move.l	a0,$9E(a4)
	move.l	d4,d0
	asr.l	#$8,d0
	move.w	d0,$9C(a4)
	ori.w	#$1000,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_13518A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
