; ---------------------------------------------------------------------------
; BroodBossParts_Update - vtable +$4A: place the part at placement + offset (+$8C/+$8E) minus the boss offsets, then run the state machine (no physics)
; Evidence: x = (+$10 + +$8C - (-$3C44 >> 8) - $20) << 8, y = (+$12 + +$8E - (-$3C48 >> 8) + $5B) << 8; timers +$6E/+$6C/+$6A as ACTOR Update; TAS 49291-51132
; ---------------------------------------------------------------------------
BroodBossParts_Update:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_085AC4
	moveq	#$2,d0
	bra.s	loc_085AC6
loc_085AC4:
	moveq	#$1,d0
loc_085AC6:
	ext.w	d0
	move.w	d0,d7
	move.w	$10(a4),d0
	ext.l	d0
	move.w	$8C(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	g_BroodBossOffsetX(a5),d0
	asr.l	#$8,d0
	sub.l	d0,d1
	add.w	#$FFE0,d1
	move.w	d1,-$2(a6)
	move.w	$12(a4),d0
	ext.l	d0
	move.w	$8E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	g_BroodBossOffsetY(a5),d0
	asr.l	#$8,d0
	sub.l	d0,d1
	move.w	d1,d4
	add.w	#$5B,d4
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	moveq	#$4,d0
	and.w	$4(a4),d0
	bne.s	loc_085B4A
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> Anim_AdvanceByDistance
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_085B4A
	ori.w	#$8,$4(a4)
loc_085B4A:
	tst.w	$6E(a4)
	ble.s	loc_085B56
	sub.w	d7,$6E(a4)
	bra.s	loc_085B5A
loc_085B56:
	clr.w	$6E(a4)
loc_085B5A:
	tst.w	$6C(a4)
	ble.s	loc_085B78
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_085B90
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_085B90
	clr.w	$6C(a4)
	bra.s	loc_085B90
loc_085B78:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.s	loc_085BD4
loc_085B90:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.s	loc_085BD4
	cmp.l	$8(a4),d5
	bne.s	loc_085BA4
	cmp.l	$C(a4),d6
	beq.s	loc_085BAA
loc_085BA4:
	ori.w	#$8,$4(a4)
loc_085BAA:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_085BC0
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	andi.w	#$FFF7,$4(a4)
	addq.w	#$4,a7
loc_085BC0:
	tst.w	$6A(a4)
	ble.s	loc_085BCA
	sub.w	d7,$6A(a4)
loc_085BCA:
	tst.w	$6A(a4)
	bge.s	loc_085BD4
	clr.w	$6A(a4)
loc_085BD4:
	movem.l	-$16(a6),d4-d7/a4
	unlk	a6
	rts
