; ---------------------------------------------------------------------------
; Actor_Update - ACTOR slot +$4A: per-frame update (handler, timers, movement)
; In:  8(a6) = object
; Out: none
; Evidence: calls the state handler +$5C when timer +$6C < 1, then Move (+$4E) (NOTES Actor classes)
; ---------------------------------------------------------------------------
Actor_Update:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_15E844
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	tst.w	$68(a4)
	addq.w	#$4,a7
	bgt.s	loc_15E834
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_15E834:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.w	loc_15EA6E
loc_15E844:
	tst.b	-$38DE(a5)
	beq.s	loc_15E84E
	moveq	#$2,d6
	bra.s	loc_15E850
loc_15E84E:
	moveq	#$1,d6
loc_15E850:
	move.l	$8(a4),d5
	move.l	$C(a4),d7
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_15E87E
	move.w	#$800,d0
	and.w	$4(a4),d0
	bne.s	loc_15E876
	movea.l	$76(a4),a0
	moveq	#$4,d0
	and.b	(a0),d0
	beq.s	loc_15E87E
loc_15E876:
	move.l	a4,-(a7)
	jsr	$4EDA(a5)	; -> sub_1F6D76
	addq.w	#$4,a7
loc_15E87E:
	move.w	#$4000,d0
	and.w	$6(a4),d0
	bne.w	loc_15E92A
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	beq.s	loc_15E8AE
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_15E8AE:
	move.w	#$80,d0
	and.w	$6(a4),d0
	bne.s	loc_15E92A
	tst.w	$16(a4)
	bne.s	loc_15E8CE
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_15E92A
	tst.w	$18(a4)
	beq.s	loc_15E92A
loc_15E8CE:
	move.b	#$FF,$7B(a4)
	cmp.l	$8(a4),d5
	bne.s	loc_15E8E0
	cmp.l	$C(a4),d7
	beq.s	loc_15E8E8
loc_15E8E0:
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	addq.w	#$4,a7
loc_15E8E8:
	move.b	$42(a4),d4
	move.l	a4,-(a7)
	jsr	$4F5A(a5)	; -> sub_1F8B42
	cmp.b	$42(a4),d4
	addq.w	#$4,a7
	beq.s	loc_15E92A
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_15E92A:
	moveq	#$4,d0
	and.w	$4(a4),d0
	bne.s	loc_15E95A
	move.l	$C(a4),d0
	sub.l	d7,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	Anim_AdvanceByDistance(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_15E95A
	ori.w	#$8,$4(a4)
loc_15E95A:
	move.w	#$200,d0
	and.w	$4(a4),d0
	bne.s	loc_15E9B0
	tst.w	$6E(a4)
	ble.s	loc_15E978
	sub.w	d6,$6E(a4)
	tst.w	$6E(a4)
	bge.s	loc_15E978
	clr.w	$6E(a4)
loc_15E978:
	tst.w	$6C(a4)
	ble.s	loc_15E996
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_15E9B0
	sub.w	d6,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_15E9B0
	clr.w	$6C(a4)
	bra.s	loc_15E9B0
loc_15E996:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.w	loc_15EA6E
loc_15E9B0:
	moveq	#$10,d0
	and.w	$4(a4),d0
	bne.w	loc_15EA6E
	cmp.l	$8(a4),d5
	bne.s	loc_15E9C6
	cmp.l	$C(a4),d7
	beq.s	loc_15E9CC
loc_15E9C6:
	ori.w	#$8,$4(a4)
loc_15E9CC:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_15E9E2
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	andi.w	#$FFF7,$4(a4)
	addq.w	#$4,a7
loc_15E9E2:
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15EA5A
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_15EA1A
	move.l	$8(a4),d0
	sub.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,g_ShiftDX(a5)
	move.l	$C(a4),d0
	sub.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,g_ShiftDY(a5)
	pea.l	Obj_CarryChild(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> Obj_ForEachChild
	addq.w	#$8,a7
loc_15EA1A:
	moveq	#$0,d7
	move.b	$3B(a4),d7
	tst.l	d7
	bra.s	loc_15EA54
loc_15EA24:
	cmpi.w	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_15EA32
	moveq	#$0,d0
	bra.s	loc_15EA40
loc_15EA32:
	ext.l	d7
	movea.l	g_ObjTable(a5),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_15EA40:
	movea.l	d0,a3
	moveq	#$0,d7
	move.b	$3C(a3),d7
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_15EA54:
	cmpi.w	#$FF,d7
	bne.s	loc_15EA24
loc_15EA5A:
	tst.w	$6A(a4)
	ble.s	loc_15EA64
	sub.w	d6,$6A(a4)
loc_15EA64:
	tst.w	$6A(a4)
	bge.s	loc_15EA6E
	clr.w	$6A(a4)
loc_15EA6E:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
