; ---------------------------------------------------------------------------
; CursorInput_Confirm - select cursor Start: join (spend a life) if not playing yet, else confirm the character and print the confirmation text under the player's side
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: cursor +$40 = 1; Cerebro_PrintText(jt $6824E at col 5 / jt $68242 at col $18, row $16) with the full-screen window
; ---------------------------------------------------------------------------
CursorInput_Confirm:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	move.w	-$3C58(a5),-$2(a6)
	move.w	-$3C56(a5),d4
	move.w	-$3C5C(a5),d5
	move.w	-$3C5A(a5),d6
	move.w	#$3,-$3C58(a5)
	move.w	#$5,-$3C56(a5)
	move.w	#$16,-$3C5C(a5)
	move.w	#$22,-$3C5A(a5)
	moveq	#$0,d0
	move.b	$3F(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_0681BC
	movea.l	-$3B28(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	beq.s	loc_06819A
	move.b	#$1,$40(a4)
	move.w	#$5,-$3B04(a5)
	move.w	#$16,-$3B06(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	Str_Selected_06824E(pc)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$8,a7
	bra.s	loc_06820A
loc_06819A:
	tst.w	g_P1Lives(a5)
	beq.s	loc_06820A
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_06820A
	subq.w	#$1,g_P1Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
	bra.s	loc_06820A
loc_0681BC:
	movea.l	-$3B2C(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	beq.s	loc_0681EA
	move.b	#$1,$40(a4)
	move.w	#$18,-$3B04(a5)
	move.w	#$16,-$3B06(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	Str_Selected(pc)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$8,a7
	bra.s	loc_06820A
loc_0681EA:
	tst.w	g_P2Lives(a5)
	beq.s	loc_06820A
	jsr	PlayerSelect_FirstFreeChar(pc)
	move.w	d0,d7
	cmpi.w	#$FFFF,d7
	beq.s	loc_06820A
	subq.w	#$1,g_P2Lives(a5)
	move.b	#$1,$33(a4)
	move.b	d7,$3D(a4)
loc_06820A:
	tst.b	$33(a4)
	bne.s	loc_068214
	clr.b	$34(a4)
loc_068214:
	move.w	-$2(a6),-$3C58(a5)
	move.w	d4,-$3C56(a5)
	move.w	d5,-$3C5C(a5)
	move.w	d6,-$3C5A(a5)
	clr.w	$6C(a3)
	lea.l	CursorInput_StatePoll(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
