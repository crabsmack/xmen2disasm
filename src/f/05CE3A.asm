; ---------------------------------------------------------------------------
; Tusk_Update - vtable +$4A: per-frame update of a TUSK
; In:  8(a6) = this (TUSK object)
; Out: none
; Evidence: class descriptor TUSK slot +$4A (tools/classes.py); TAS frames 20343-21960 (1555 active)
; ---------------------------------------------------------------------------
Tusk_Update:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	lea.l	$D7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a3),d0
	addq.w	#$4,a7
	bne.w	loc_05CF5E
	tst.b	$9A(a3)
	beq.s	loc_05CE9E
	tst.b	-$38DE(a5)
	beq.s	loc_05CE76
	moveq	#$2,d0
	bra.s	loc_05CE78
loc_05CE76:
	moveq	#$1,d0
loc_05CE78:
	move.w	d0,d7
loc_05CE7A:
	subq.b	#$1,$9A(a3)
	tst.b	$9A(a3)
	bne.s	loc_05CE9A
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a3),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a3)
	addq.w	#$8,a7
	bra.s	loc_05CE9E
loc_05CE9A:
	subq.w	#$1,d7
	bne.s	loc_05CE7A
loc_05CE9E:
	tst.w	$6A(a3)
	bne.s	loc_05CEAA
	andi.w	#$FFBF,$6(a3)
loc_05CEAA:
	move.w	$12(a3),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	lea.l	g_Player1(a5),a4
loc_05CEB8:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05CF44
	cmp.l	$C(a4),d7
	ble.s	loc_05CF0E
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_05CF44
	andi.b	#$FB,$2E(a4)
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$88(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
	bra.s	loc_05CF44
loc_05CF0E:
	moveq	#$4,d0
	and.b	$2E(a4),d0
	bne.s	loc_05CF44
	ori.b	#$4,$2E(a4)
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$88(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_05CF44:
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_05CF58
	lea.l	g_Player2(a5),a4
	move.l	a4,d0
	bra.s	loc_05CF5A
loc_05CF58:
	moveq	#$0,d0
loc_05CF5A:
	bne.w	loc_05CEB8
loc_05CF5E:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
