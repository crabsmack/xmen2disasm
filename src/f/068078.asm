; ---------------------------------------------------------------------------
; CursorInput_MoveRight - select cursor Right: join (spend a life) or move to the next free portrait
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: PlayerSelect_FirstFreeChar / PlayerSelect_NextFreeChar
; ---------------------------------------------------------------------------
CursorInput_MoveRight:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.b	$3C(a4),d0
	ext.w	d0
	move.w	d0,d6
	cmpi.w	#$FFFF,d6
	beq.s	loc_0680B2
	ext.l	d6
	move.l	d6,-(a7)
	jsr	PlayerSelect_NextFreeChar(pc)
	move.w	d0,d7
	cmp.w	d7,d6
	addq.w	#$4,a7
	beq.s	loc_068100
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068100
loc_0680B2:
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_0680E0
	tst.w	g_P1Lives(a5)
	beq.s	loc_068100
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068100
	subq.w	#$1,g_P1Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068100
loc_0680E0:
	tst.w	g_P2Lives(a5)
	beq.s	loc_068100
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068100
	subq.w	#$1,g_P2Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
loc_068100:
	tst.b	$33(a4)
	bne.s	loc_06810A
	clr.b	$34(a4)
loc_06810A:
	clr.w	$6C(a3)
	lea.l	CursorInput_StatePoll(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
