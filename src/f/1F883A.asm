; ---------------------------------------------------------------------------
; loc_1F883A	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1F883A:
	cmp.w	$4C(a4),d5
	ble.w	loc_1F8ACA
	cmp.w	$50(a4),d4
	bge.w	loc_1F8ACA
	moveq	#$0,d3
	move.w	$4(a3),d3
	beq.s	loc_1F8876
	move.w	d6,d1
	sub.w	$A(a3),d1
	cmpi.w	#$100,d3
	bne.s	loc_1F8864
	move.w	d1,d3
	ext.l	d3
	bra.s	loc_1F8876
loc_1F8864:
	cmpi.w	#$FF00,d3
	bne.s	loc_1F8872
	move.w	d1,d3
	neg.w	d3
	ext.l	d3
	bra.s	loc_1F8876
loc_1F8872:
	muls.w	d1,d3
	asr.l	#$8,d3
loc_1F8876:
	move.w	$8(a3),d1
	sub.w	$4E(a4),d1
	ext.l	d1
	add.l	d1,d3
	tst.l	d3
	ble.w	loc_1F8ACA
	moveq	#$40,d0
	cmp.l	d0,d3
	bgt.w	loc_1F8ACA
	move.b	d3,$3(a2)
	moveq	#$20,d0
	cmp.b	$1(a3),d0
	bne.w	loc_1F8AD6
	move.b	#$4,$7(a2)
	ori.w	#$8000,(a2)
	bra.w	loc_1F8AD6
loc_1F88AC:
	cmp.w	$4C(a4),d5
	ble.w	loc_1F8ACA
	cmp.w	$50(a4),d4
	bge.w	loc_1F8ACA
	moveq	#$0,d3
	move.w	$4(a3),d3
	beq.s	loc_1F88E8
	move.w	d6,d1
	sub.w	$A(a3),d1
	cmpi.w	#$100,d3
	bne.s	loc_1F88D6
	move.w	d1,d3
	ext.l	d3
	bra.s	loc_1F88E8
loc_1F88D6:
	cmpi.w	#$FF00,d3
	bne.s	loc_1F88E4
	move.w	d1,d3
	neg.w	d3
	ext.l	d3
	bra.s	loc_1F88E8
loc_1F88E4:
	muls.w	d1,d3
	asr.l	#$8,d3
loc_1F88E8:
	move.w	$8(a3),d1
	sub.w	$52(a4),d1
	ext.l	d1
	add.l	d1,d3
	tst.l	d3
	bge.w	loc_1F8ACA
	moveq	#-$40,d0
	cmp.l	d0,d3
	blt.w	loc_1F8ACA
	move.b	d3,$3(a2)
	moveq	#$1F,d0
	cmp.b	$1(a3),d0
	bne.w	loc_1F891E
	move.b	#$4,$7(a2)
	ori.w	#$8000,(a2)
	bra.w	loc_1F8AD6
loc_1F891E:
	moveq	#$12,d0
	cmp.b	$1(a3),d0
	bne.w	loc_1F8AD6
	pea.l	($1).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$4,a7
	clr.b	(a3)
	bra.w	loc_1F8ACA
loc_1F8938:
	move.l	a2,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F7300(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1F8AEE
loc_1F894A:
	move.l	a2,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F7300(pc)
	lea.l	$C(a7),a7
	bra.w	loc_1F8AEE
