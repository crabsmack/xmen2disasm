; ---------------------------------------------------------------------------
; sub_088112	[link-after-rts]
; ---------------------------------------------------------------------------
sub_088112:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d6
	move.w	$32(a4),d7
	move.w	g_CameraX(a5),d5
	move.w	g_CameraY(a5),d5
	move.w	d6,g_CameraX(a5)
	move.w	d7,g_CameraY(a5)
	move.w	g_CameraX(a5),d0
	cmp.w	-$3B24(a5),d0
	beq.s	loc_088146
	move.w	-$3B24(a5),g_CameraX(a5)
loc_088146:
	move.w	g_CameraY(a5),d0
	cmp.w	-$3B22(a5),d0
	beq.s	loc_088156
	move.w	-$3B22(a5),g_CameraY(a5)
loc_088156:
	tst.l	-$38A4(a5)
	beq.s	loc_0881D2
	movea.l	-$38A4(a5),a0
	moveq	#$64,d0
	cmp.b	(a0),d0
	bne.s	loc_08816E
	moveq	#$0,d0
	move.l	d0,-$38A4(a5)
	bra.s	loc_0881D2
loc_08816E:
	movea.l	-$38A4(a5),a0
	moveq	#$65,d0
	cmp.b	(a0),d0
	bne.s	loc_088186
	move.b	$1(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d0,-$38A4(a5)
	bra.s	loc_0881D2
loc_088186:
	movea.l	-$38A4(a5),a0
	moveq	#$66,d0
	cmp.b	(a0),d0
	bne.s	loc_0881B2
	move.l	a0,d0
	addq.l	#$1,-$38A4(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	movea.l	-$38A4(a5),a0
	addq.l	#$1,-$38A4(a5)
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F92(a5)	; -> Sys_Nop1F945C
	addq.w	#$8,a7
	bra.s	loc_0881D2
loc_0881B2:
	movea.l	-$38A4(a5),a0
	addq.l	#$1,-$38A4(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,g_CameraX(a5)
	movea.l	-$38A4(a5),a0
	addq.l	#$1,-$38A4(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,g_CameraY(a5)
loc_0881D2:
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$349C(a5)
	move.l	-$3C48(a5),d0
	asr.l	#$8,d0
	move.w	d0,-$34A0(a5)
	move.w	-$3B02(a5),d0
	add.w	d0,-$3AC2(a5)
	move.w	-$3494(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	-$349E(a5),d0
	move.w	d0,-$3AC4(a5)
	move.w	-$3496(a5),d0
	muls.w	g_CameraX(a5),d0
	asr.l	#$8,d0
	add.w	-$349C(a5),d0
	move.w	d0,-$3AC6(a5)
	move.w	-$3498(a5),d0
	muls.w	g_CameraY(a5),d0
	asr.l	#$8,d0
	add.w	-$34A0(a5),d0
	move.w	d0,-$3AC8(a5)
	clr.w	-$3B02(a5)
	move.w	-$3C4E(a5),d0
	btst	#$0,d0
	beq.s	loc_088250
	move.w	-$3AC2(a5),d0
	ext.l	d0
	cmp.l	-$3B20(a5),d0
	bge.s	loc_088250
	addi.w	#$3C0,-$3AC2(a5)
	addi.w	#$3C0,-$3ACA(a5)
	subi.w	#$3C0,-$3AD2(a5)
loc_088250:
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,-$3A56(a5)
	move.b	#$1,-$3A58(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
