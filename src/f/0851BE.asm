; ---------------------------------------------------------------------------
; SmallBrood_StateExplode - SMALLBROOD state: explode - hurt players within +-$3C x / +-$28 y and die
; In:  8(a6) = this
; Out: none
; Evidence: same blast as DropBomb_StateExplode (player slot +$26 with damage +$70), then sub_13DE36 (death effect type 1)
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateExplode:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$52(a3),d0
	ext.l	d0
	move.w	$4E(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	lsl.l	#$7,d5
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	lsl.l	#$7,d6
	move.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,-$A(a6)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	move.w	-$A(a6),d0
	ext.l	d0
	moveq	#$3C,d1
	sub.l	d1,d0
	move.w	d0,-$6(a6)
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,d4
	moveq	#$28,d0
	sub.l	d0,d4
	move.w	-$6(a6),d2
	ext.l	d2
	moveq	#$78,d1
	add.l	d1,d2
	move.w	d2,-$4(a6)
	ext.l	d4
	move.l	d4,d2
	moveq	#$50,d1
	add.l	d1,d2
	move.w	d2,-$2(a6)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$0,d7
	lea.l	$C(a7),a7
loc_085244:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_085254
	lea.l	g_Player1(a5),a4
	move.l	a4,d0
	bra.s	loc_08525A
loc_085254:
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
loc_08525A:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0852E4
	tst.w	$6A(a4)
	bne.s	loc_0852E4
	move.w	-$6(a6),d0
	cmp.w	$5A(a4),d0
	bgt.s	loc_0852E4
	move.w	-$4(a6),d0
	cmp.w	$56(a4),d0
	blt.s	loc_0852E4
	cmp.w	$58(a4),d4
	bgt.s	loc_0852E4
	move.w	-$2(a6),d0
	cmp.w	$54(a4),d0
	blt.s	loc_0852E4
	cmp.l	$8(a4),d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_0852AC
	moveq	#$6,d0
	bra.s	loc_0852AE
loc_0852AC:
	moveq	#$5,d0
loc_0852AE:
	move.w	d0,d6
	move.w	-$8(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$70(a3),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$A,$6A(a3)
	lea.l	$18(a7),a7
loc_0852E4:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.w	loc_085244
	move.l	a3,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	addq.w	#$4,a7
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
