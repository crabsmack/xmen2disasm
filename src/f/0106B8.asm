; ---------------------------------------------------------------------------
; BigAcolyte_Draw - vtable +$1A: draw a BIGACOLYTE
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$1A (tools/classes.py); TAS frames 13007-13657 (617 active)
; ---------------------------------------------------------------------------
BigAcolyte_Draw:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6A(a4)
	bne.s	loc_0106D0
	andi.w	#$FFBF,$6(a4)
loc_0106D0:
	moveq	#$40,d0
	and.w	$6(a4),d0
	beq.s	loc_0106E8
	moveq	#$1,d0
	and.w	-$3A24(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.w	loc_0107E0
loc_0106E8:
	tst.b	$A9(a4)
	beq.s	loc_01072A
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d1
	move.l	d1,-(a7)
	move.w	$4E(a4),d1
	ext.l	d1
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d1
	move.l	d1,-(a7)
	jsr	$50C2(a5)	; -> sub_1FD520
	lea.l	$10(a7),a7
	bra.w	loc_0107E0
loc_01072A:
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$FF,d0
	beq.w	loc_0107E0
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_010758
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_010758
	moveq	#$1,d3
loc_010758:
	tst.b	d3
	beq.s	loc_010774
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_010784
loc_010774:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_010784:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_0107A6
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_0107A6
	moveq	#$1,d3
loc_0107A6:
	tst.b	d3
	beq.s	loc_0107C2
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_0107D2
loc_0107C2:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_0107D2:
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$C(a7),a7
loc_0107E0:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
