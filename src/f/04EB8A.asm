; ---------------------------------------------------------------------------
; sub_04EB8A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04EB8A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	clr.b	d7
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_04EBBA
	tst.w	-$16F0(a5)
	ble.s	loc_04EBBA
	moveq	#$1,d6
loc_04EBBA:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_04EBDA
	tst.w	-$17E0(a5)
	ble.s	loc_04EBDA
	moveq	#$1,d7
loc_04EBDA:
	tst.b	d6
	beq.s	loc_04EBEA
	moveq	#$0,d0
	move.b	-$171E(a5),d0
	cmpi.w	#$FF,d0
	beq.s	loc_04EC48
loc_04EBEA:
	tst.b	d7
	beq.s	loc_04EBFA
	moveq	#$0,d0
	move.b	-$180E(a5),d0
	cmpi.w	#$FF,d0
	beq.s	loc_04EC48
loc_04EBFA:
	tst.b	d6
	beq.s	loc_04EC12
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_Player1(a5)
	movea.l	g_Player1(a5),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_04EC12:
	tst.b	d7
	beq.s	loc_04EC2A
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_Player2(a5)
	movea.l	g_Player2(a5),a0
	movea.l	$7A(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_04EC2A:
	move.w	#$FFE0,$20(a4)
	move.w	#$FFF0,$1E(a4)
	pea.l	($B4).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	move.w	#$FF,$6C(a4)
	addq.w	#$4,a7
	bra.s	loc_04EC5A
loc_04EC48:
	clr.w	$6C(a4)
	lea.l	sub_04EB8A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04EC5A:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
