; ---------------------------------------------------------------------------
; SporeMine_UpdatePool - SPOREMINE pool timer: run each spore - remove dead ones, release ones outside the active window back to their spawn records, call the record handler (+$18) when its delay runs out, step its animation
; In:  none
; Out: none
; Evidence: TAS 27886-30595 every frame
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_UpdatePool:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_0BEF24
	moveq	#$2,d0
	bra.s	loc_0BEF26
loc_0BEF24:
	moveq	#$1,d0
loc_0BEF26:
	move.w	d0,d6
	movea.l	-$3C28(a5),a4
	clr.w	d7
	bra.w	loc_0BF036
loc_0BEF32:
	tst.l	$18(a4)
	bne.s	loc_0BEF4C
	move.l	a4,-(a7)
	jsr	SporeMine_RemoveSpore(pc)
	move.w	d7,d0
	subq.w	#$1,d7
	lea.l	-$26(a4),a4
	addq.w	#$4,a7
	bra.w	loc_0BF02E
loc_0BEF4C:
	move.w	$4(a4),d4
	sub.w	g_CameraX(a5),d4
	move.w	$6(a4),d5
	sub.w	g_CameraY(a5),d5
	cmp.w	-$35C0(a5),d4
	blt.s	loc_0BEF88
	ext.l	d4
	move.w	-$35C2(a5),d0
	ext.l	d0
	moveq	#$20,d1
	add.l	d1,d0
	cmp.l	d4,d0
	blt.s	loc_0BEF88
	cmp.w	-$35C4(a5),d5
	blt.s	loc_0BEF88
	ext.l	d5
	move.w	-$35C6(a5),d0
	ext.l	d0
	moveq	#$20,d1
	add.l	d1,d0
	cmp.l	d5,d0
	bge.s	loc_0BEFA6
loc_0BEF88:
	movea.l	$8(a4),a0
	move.b	#$1,$4(a0)
	move.l	a4,-(a7)
	jsr	SporeMine_RemoveSpore(pc)
	move.w	d7,d0
	subq.w	#$1,d7
	lea.l	-$26(a4),a4
	addq.w	#$4,a7
	bra.w	loc_0BF02E
loc_0BEFA6:
	tst.w	$1E(a4)
	ble.s	loc_0BEFB0
	sub.w	d6,$1E(a4)
loc_0BEFB0:
	tst.w	$1C(a4)
	bgt.s	loc_0BEFC2
	move.l	a4,-(a7)
	movea.l	$18(a4),a0
	jsr	(a0)
	addq.w	#$4,a7
	bra.s	loc_0BEFC6
loc_0BEFC2:
	sub.w	d6,$1C(a4)
loc_0BEFC6:
	tst.l	$10(a4)
	beq.s	loc_0BF02E
	movea.l	$10(a4),a0
	move.w	$16(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_0BF02A
	clr.w	$16(a4)
	addq.w	#$1,$14(a4)
	movea.l	$10(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$14(a4),d0
	bgt.s	loc_0BF00A
	clr.w	$14(a4)
	movea.l	$10(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_0BF00A
	moveq	#$0,d0
	move.l	d0,$10(a4)
loc_0BF00A:
	tst.l	$10(a4)
	beq.s	loc_0BF02E
	move.w	$14(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$10(a4),d0
	movea.l	d0,a0
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	bra.s	loc_0BF02E
loc_0BF02A:
	add.w	d6,$16(a4)
loc_0BF02E:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$26(a4),a4
loc_0BF036:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$3C24(a5),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_0BEF32
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
