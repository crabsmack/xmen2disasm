; ---------------------------------------------------------------------------
; sub_09B6A2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09B6A2:
	link.w	a6,#$FFEC
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d7
	tst.l	$96(a4)
	beq.w	loc_09B780
	moveq	#$1,d7
	lea.l	g_Player1(a5),a3
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09B6F0
	move.w	$4E(a3),d0
	ext.l	d0
	move.w	$52(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	asr.l	#$1,d6
	cmpi.w	#$71E,d6
	ble.s	loc_09B6F0
	clr.b	d7
loc_09B6F0:
	lea.l	g_Player2(a5),a3
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09B726
	move.w	$4E(a3),d0
	ext.l	d0
	move.w	$52(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	asr.l	#$1,d6
	cmpi.w	#$71E,d6
	ble.s	loc_09B726
	clr.b	d7
loc_09B726:
	tst.b	d7
	beq.s	loc_09B788
	moveq	#$0,d0
	move.l	d0,-$3416(a5)
	move.l	d0,-$3402(a5)
	clr.b	$90(a4)
	clr.w	$16(a4)
	move.l	d0,$92(a4)
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	move.l	d0,$92(a0)
	move.l	d0,g_CamShake(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	($5A0).w
	pea.l	($5EA).w
	move.l	g_Camera(a5),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	lea.l	$1C(a7),a7
	bra.s	loc_09B788
loc_09B780:
	tst.w	-$3C3C(a5)
	ble.s	loc_09B788
	moveq	#$1,d7
loc_09B788:
	tst.b	d7
	bne.s	loc_09B7A2
	clr.w	$6C(a4)
	lea.l	sub_09B6A2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_09B896
loc_09B7A2:
	moveq	#$0,d0
	movea.l	d0,a3
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.l	$8(a4),d0
	asr.l	#$8,d0
	add.w	#$FFD8,d0
	move.w	d0,-$E(a6)
	move.w	$12(a4),d0
	sub.w	#$FFE4,d0
	move.w	d0,-$C(a6)
	tst.l	$96(a4)
	lea.l	$C(a7),a7
	beq.s	loc_09B7FE
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09B7F8
	lea.l	g_Player2(a5),a3
	bra.s	loc_09B820
loc_09B7F8:
	lea.l	g_Player1(a5),a3
	bra.s	loc_09B820
loc_09B7FE:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09B81C
	lea.l	g_Player1(a5),a3
	bra.s	loc_09B820
loc_09B81C:
	lea.l	g_Player2(a5),a3
loc_09B820:
	move.l	a3,-(a7)
	pea.l	-$10(a6)
	jsr	$18DA(a5)	; -> XClone_SpawnByType
	move.l	d0,-$14(a6)
	addq.w	#$8,a7
	beq.s	loc_09B862
	move.l	a3,d0
	beq.s	loc_09B856
	movea.l	-$14(a6),a0
	move.l	$8(a3),d0
	cmp.l	$8(a0),d0
	bge.s	loc_09B84C
	ori.b	#$10,$2E(a0)
	bra.s	loc_09B856
loc_09B84C:
	movea.l	-$14(a6),a0
	andi.b	#$EF,$2E(a0)
loc_09B856:
	move.l	-$14(a6),-(a7)
	jsr	$16B2(a5)	; -> sub_0959E0
	addq.w	#$4,a7
	bra.s	loc_09B86A
loc_09B862:
	move.w	-$3C40(a5),d0
	addq.w	#$1,-$3C40(a5)
loc_09B86A:
	tst.l	$96(a4)
	beq.s	loc_09B88A
	lea.l	sub_09B6A2(pc),a0
	movea.l	$96(a4),a1
	move.l	a0,$5C(a1)
	movea.l	$96(a4),a0
	clr.w	$6C(a0)
	moveq	#$0,d0
	move.l	d0,$96(a4)
loc_09B88A:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_09B896:
	movem.l	-$24(a6),d6-d7/a3-a4
	unlk	a6
	rts
