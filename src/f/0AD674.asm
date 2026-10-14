; ---------------------------------------------------------------------------
; sub_0AD674	[jt 894]
; ---------------------------------------------------------------------------
sub_0AD674:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d0
	ext.l	d0
	move.w	$2C(a4),d1
	ext.l	d1
	move.l	d1,d6
	add.l	d0,d6
	move.w	$32(a4),d0
	ext.l	d0
	move.w	$2E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.w	$5C(a4),d0
	ext.l	d0
	move.l	d0,d7
	add.l	d1,d7
	move.w	-$348E(a5),d5
	move.w	-$3490(a5),d5
	move.w	d6,-$348E(a5)
	move.w	d7,-$3490(a5)
	move.w	-$348E(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_0AD6C8
	move.w	-$3A8E(a5),-$348E(a5)
loc_0AD6C8:
	move.w	-$348E(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_0AD6D8
	move.w	-$3A90(a5),-$348E(a5)
loc_0AD6D8:
	move.w	-$3490(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_0AD6E8
	move.w	-$3A92(a5),-$3490(a5)
loc_0AD6E8:
	move.w	-$3490(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_0AD6F8
	move.w	-$3A94(a5),-$3490(a5)
loc_0AD6F8:
	move.w	-$3492(a5),d0
	muls.w	-$348E(a5),d0
	asr.l	#$8,d0
	add.w	-$349A(a5),d0
	move.w	d0,-$3AC2(a5)
	move.w	-$3494(a5),d0
	muls.w	-$3490(a5),d0
	asr.l	#$8,d0
	add.w	-$349E(a5),d0
	move.w	d0,-$3AC4(a5)
	move.w	-$3496(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4E3A(a5)	; -> sub_1F6258
	move.w	d0,-$3AC6(a5)
	move.w	-$38BC(a5),d0
	ext.l	d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	#$100,d1
	sub.w	d0,d1
	move.w	d1,-$3AC8(a5)
	tst.b	-$3AB4(a5)
	addq.w	#$8,a7
	beq.s	loc_0AD75A
	andi.w	#$1FF,-$3AC6(a5)
loc_0AD75A:
	tst.b	-$3AB6(a5)
	beq.s	loc_0AD766
	andi.w	#$FF,-$3AC8(a5)
loc_0AD766:
	jsr	$4D9A(a5)	; -> sub_1F485A
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> sub_1F4854
	move.b	#$1,-$3A56(a5)
	move.b	-$3A64(a5),-$3A58(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
