; ---------------------------------------------------------------------------
; EvilBeam_Update - EVILBEAM slot +$0E (timer callback): step the animation and hurt players at the beam while it plays; destroy itself when it ends
; In:  8(a6) = this
; Out: none
; Evidence: player box containing the beam point -> slot +$26 TakeDamage(0, $C, 1, x, y); animation end -> slot +$16
; Found: jt 770
; ---------------------------------------------------------------------------
EvilBeam_Update:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d7
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_098084
	moveq	#$2,d0
	bra.s	loc_098086
loc_098084:
	moveq	#$1,d0
loc_098086:
	move.w	d0,d6
	tst.l	$8(a4)
	beq.w	loc_09811A
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_09809A
	moveq	#$2,d0
	bra.s	loc_09809C
loc_09809A:
	moveq	#$1,d0
loc_09809C:
	ext.w	d0
	add.w	d0,$C(a4)
	movea.l	$8(a4),a0
	move.w	$C(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_098112
	addq.w	#$1,$E(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$E(a4),d0
	bgt.s	loc_0980D8
	clr.w	$E(a4)
	movea.l	$8(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_0980D8
	moveq	#$0,d0
	move.l	d0,$8(a4)
loc_0980D8:
	tst.l	$8(a4)
	beq.s	loc_098112
	move.w	$E(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$8(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$11(a4)
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_098108
	move.b	$11(a4),d0
	cmp.b	$1A(a4),d0
	beq.s	loc_09810E
loc_098108:
	andi.b	#$DF,$10(a4)
loc_09810E:
	clr.w	$C(a4)
loc_098112:
	tst.l	$8(a4)
	beq.s	loc_09811A
	clr.b	d7
loc_09811A:
	tst.b	d7
	beq.s	loc_09812E
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$16(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_0981F2
loc_09812E:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_098190
	move.w	$4(a4),d0
	cmp.w	g_Player1+$56(a5),d0
	blt.s	loc_098190
	move.w	$4(a4),d0
	cmp.w	g_Player1+$5A(a5),d0
	bgt.s	loc_098190
	cmp.w	g_Player1+$54(a5),d7
	blt.s	loc_098190
	cmp.w	g_Player1+$58(a5),d7
	bgt.s	loc_098190
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_098190:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0981F2
	move.w	$4(a4),d0
	cmp.w	g_Player2+$56(a5),d0
	blt.s	loc_0981F2
	move.w	$4(a4),d0
	cmp.w	g_Player2+$5A(a5),d0
	bgt.s	loc_0981F2
	cmp.w	g_Player2+$54(a5),d7
	blt.s	loc_0981F2
	cmp.w	g_Player2+$58(a5),d7
	bgt.s	loc_0981F2
	ext.l	d7
	move.l	d7,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0981F2:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
