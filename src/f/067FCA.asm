; ---------------------------------------------------------------------------
; CursorInput_MoveLeft - select cursor Left: if the player has no character yet, join (spend a life) on the first free portrait; else move to the previous free portrait
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: g_P1Lives/g_P2Lives -= 1; PlayerSelect_FirstFreeChar / PlayerSelect_PrevFreeChar; cursor +$33 changed, +$3D new index
; ---------------------------------------------------------------------------
CursorInput_MoveLeft:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.b	$3C(a4),d0
	ext.w	d0
	move.w	d0,d6
	cmpi.w	#$FFFF,d6
	beq.s	loc_068004
	ext.l	d6
	move.l	d6,-(a7)
	jsr	PlayerSelect_PrevFreeChar(pc)
	move.w	d0,d7
	cmp.w	d7,d6
	addq.w	#$4,a7
	beq.s	loc_068052
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068052
loc_068004:
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_068032
	tst.w	g_P1Lives(a5)
	beq.s	loc_068052
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068052
	subq.w	#$1,g_P1Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_068052
loc_068032:
	tst.w	g_P2Lives(a5)
	beq.s	loc_068052
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_068052
	subq.w	#$1,g_P2Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
loc_068052:
	tst.b	$33(a4)
	bne.s	loc_06805C
	clr.b	$34(a4)
loc_06805C:
	clr.w	$6C(a3)
	lea.l	CursorInput_StatePoll(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
