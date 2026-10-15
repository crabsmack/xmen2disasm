; ---------------------------------------------------------------------------
; YoyoAcolyte_Update - parent Update, then while the yoyo is out (+$B4 bit 0) and +4 bit $10 is clear, set +$B4 bit 1 once the yoyo is back within 40 px (72 when flipped) of the hand (YOYOACOLYTE override of slot +$4A Update)
; In:  8(a6) = this (YOYOACOLYTE object)
; Out: none
; Evidence: class descriptor YOYOACOLYTE slot +$4A (tools/classes.py); TAS frames 12185-16731 (1160 active)
; ---------------------------------------------------------------------------
YoyoAcolyte_Update:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$47A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.s	loc_01C242
	move.w	$B4(a4),d0
	btst	#$0,d0
	beq.s	loc_01C242
	lea.l	$A0(a4),a3
	move.l	(a3),d0
	asr.l	#$8,d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_01C222
	move.l	(a3),d0
	asr.l	#$8,d0
	bra.s	loc_01C228
loc_01C222:
	move.l	(a3),d0
	asr.l	#$8,d0
	neg.l	d0
loc_01C228:
	move.w	d0,d6
	moveq	#$28,d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_01C238
	addi.w	#$20,d7
loc_01C238:
	cmp.w	d6,d7
	ble.s	loc_01C242
	ori.w	#$2,$B4(a4)
loc_01C242:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
