; ---------------------------------------------------------------------------
; BigBio_StateGatherOrbs - BIGBIO: pull the orbs onto the shape (8 px per step); when done land animation, sounds, next entry
; In:  8(a6) = this
; Out: d0
; Evidence: sounds $FB/$F8
; ---------------------------------------------------------------------------
BigBio_StateGatherOrbs:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	g_BigBioOrbs(a5),a4
	movea.l	$8(a6),a0
	movea.l	$AC(a0),a3
	moveq	#$1,d7
	moveq	#$10,d0
	and.b	$2E(a0),d0
	move.b	d0,-$3(a6)
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	clr.w	-$A(a6)
	moveq	#$10,d3
loc_1224EA:
	tst.b	-$3(a6)
	beq.s	loc_1224F8
	move.w	(a3),d4
	add.w	-$8(a6),d4
	bra.s	loc_1224FE
loc_1224F8:
	move.w	-$8(a6),d4
	sub.w	(a3),d4
loc_1224FE:
	move.w	d4,d6
	sub.w	(a4),d6
	cmpi.w	#$8,d6
	ble.s	loc_12250E
	addq.w	#$8,(a4)
	clr.b	d7
	bra.s	loc_12252C
loc_12250E:
	tst.w	d6
	ble.s	loc_122518
	add.w	d6,(a4)
	clr.b	d7
	bra.s	loc_12252C
loc_122518:
	cmpi.w	#$FFF8,d6
	bge.s	loc_122524
	subq.w	#$8,(a4)
	clr.b	d7
	bra.s	loc_12252C
loc_122524:
	tst.w	d6
	bge.s	loc_12252C
	add.w	d6,(a4)
	clr.b	d7
loc_12252C:
	move.w	$2(a3),d0
	add.w	-$6(a6),d0
	move.w	d0,d5
	move.w	d5,-$2(a6)
	sub.w	$2(a4),d5
	cmpi.w	#$8,d5
	ble.s	loc_12254C
	addq.w	#$8,$2(a4)
	clr.b	d7
	bra.s	loc_122570
loc_12254C:
	tst.w	d5
	ble.s	loc_122558
	add.w	d5,$2(a4)
	clr.b	d7
	bra.s	loc_122570
loc_122558:
	cmpi.w	#$FFF8,d5
	bge.s	loc_122566
	subq.w	#$8,$2(a4)
	clr.b	d7
	bra.s	loc_122570
loc_122566:
	tst.w	d5
	bge.s	loc_122570
	add.w	d5,$2(a4)
	clr.b	d7
loc_122570:
	addq.w	#$8,a3
	addq.w	#$6,a4
	move.w	-$A(a6),d0
	addq.w	#$1,-$A(a6)
	cmp.w	-$A(a6),d3
	bgt.w	loc_1224EA
	tst.b	d7
	beq.w	loc_122626
	movea.l	$8(a6),a0
	andi.w	#$FFF7,$A2(a0)
	lea.l	$347A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($FB).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F8).w
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8(a6),a0
	tst.l	$98(a0)
	lea.l	$14(a7),a7
	bne.s	loc_1225DE
	movea.l	a0,a1
	move.l	$64(a0),$5C(a1)
	movea.l	$8(a6),a0
	move.w	#$FF,$6C(a0)
	bra.s	loc_122656
loc_1225DE:
	movea.l	$8(a6),a0
	addq.w	#$1,$96(a0)
	movea.l	$8(a6),a0
	movea.l	a0,a1
	movea.l	$98(a1),a1
	move.w	$96(a0),d0
	cmp.w	(a1),d0
	blt.s	loc_1225FC
	clr.w	$96(a0)
loc_1225FC:
	movea.l	$8(a6),a0
	movea.l	$98(a0),a0
	addq.l	#$2,a0
	movea.l	$8(a6),a1
	move.w	$96(a1),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	movea.l	a1,a0
	move.l	d0,$5C(a0)
	movea.l	$8(a6),a0
	move.w	#$FF,$6C(a0)
	bra.s	loc_122656
loc_122626:
	movea.l	$8(a6),a0
	moveq	#$1,d0
	cmp.w	$6E(a0),d0
	bne.s	loc_122638
	move.b	#$1,$B7(a0)
loc_122638:
	movea.l	$8(a6),a0
	clr.w	$6C(a0)
	lea.l	BigBio_StateGatherOrbs(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
loc_122656:
	movem.l	-$26(a6),d3-d7/a3-a4
	unlk	a6
	rts
