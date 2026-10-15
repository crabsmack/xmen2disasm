; ---------------------------------------------------------------------------
; sub_1F5F78	[jt 2498]
; ---------------------------------------------------------------------------
sub_1F5F78:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	-$348E(a5),d6
	move.w	-$3490(a5),d7
	move.w	$A(a6),-$348E(a5)
	move.w	$E(a6),-$3490(a5)
	move.w	-$348E(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_1F5FA4
	move.w	-$3A8E(a5),-$348E(a5)
loc_1F5FA4:
	move.w	-$348E(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_1F5FB4
	move.w	-$3A90(a5),-$348E(a5)
loc_1F5FB4:
	move.w	-$3490(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_1F5FC4
	move.w	-$3A92(a5),-$3490(a5)
loc_1F5FC4:
	move.w	-$3490(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_1F5FD4
	move.w	-$3A94(a5),-$3490(a5)
loc_1F5FD4:
	tst.b	-$3AB8(a5)
	bne.s	loc_1F5FF4
	tst.b	-$3ABA(a5)
	bne.s	loc_1F5FF4
	cmp.w	-$348E(a5),d6
	bne.s	loc_1F5FF4
	cmp.w	-$3490(a5),d7
	bne.s	loc_1F5FF4
	tst.b	-$3AC0(a5)
	beq.w	loc_1F60DA
loc_1F5FF4:
	move.w	-$348E(a5),-$3AC2(a5)
	move.w	-$3490(a5),-$3AC4(a5)
	tst.b	-$3AC0(a5)
	beq.s	loc_1F600C
	addi.w	#$100,-$3ACC(a5)
loc_1F600C:
	clr.b	-$3AC0(a5)
	tst.b	-$3ABA(a5)
	beq.s	loc_1F6050
	movea.l	-$3AFE(a5),a0
	move.l	$8(a0),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3ABC(a5),d1
	sub.w	d0,d1
	move.w	d1,-$3AC6(a5)
	movea.l	-$3AFE(a5),a0
	move.l	$C(a0),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3ABE(a5),d1
	sub.w	d0,d1
	move.w	d1,-$3AC8(a5)
	bra.s	loc_1F60A2
loc_1F6050:
	move.w	-$3496(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	sub_1F6258(pc)
	move.w	d0,-$3AC6(a5)
	move.w	-$3490(a5),d0
	ext.l	d0
	move.w	-$349E(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.w	-$3498(a5),d1
	ext.l	d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	asr.l	#$8,d0
	add.w	-$34A0(a5),d0
	move.w	d0,-$3AC8(a5)
	tst.b	-$3AB8(a5)
	addq.w	#$8,a7
	beq.s	loc_1F60A2
	move.w	-$3ABC(a5),d0
	add.w	d0,-$3AC6(a5)
	move.w	-$3ABE(a5),d0
	add.w	d0,-$3AC8(a5)
loc_1F60A2:
	tst.b	-$3AB4(a5)
	beq.s	loc_1F60AE
	andi.w	#$1FF,-$3AC6(a5)
loc_1F60AE:
	tst.b	-$3AB6(a5)
	beq.s	loc_1F60BA
	andi.w	#$FF,-$3AC8(a5)
loc_1F60BA:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,-$3A56(a5)
	move.b	-$3A64(a5),-$3A58(a5)
loc_1F60DA:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
