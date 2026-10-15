; ---------------------------------------------------------------------------
; sub_160BB0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_160BB0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	-$38A4(a5)
	beq.s	loc_160C36
	movea.l	-$38A4(a5),a0
	moveq	#$64,d0
	cmp.b	(a0),d0
	bne.s	loc_160BD2
	moveq	#$0,d0
	move.l	d0,-$38A4(a5)
	bra.s	loc_160C36
loc_160BD2:
	movea.l	-$38A4(a5),a0
	moveq	#$65,d0
	cmp.b	(a0),d0
	bne.s	loc_160BEA
	move.b	$1(a0),d0
	ext.w	d0
	ext.l	d0
	sub.l	d0,-$38A4(a5)
	bra.s	loc_160C36
loc_160BEA:
	movea.l	-$38A4(a5),a0
	moveq	#$66,d0
	cmp.b	(a0),d0
	bne.s	loc_160C16
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
	bra.s	loc_160C36
loc_160C16:
	movea.l	-$38A4(a5),a0
	addq.l	#$1,-$38A4(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,$30(a4)
	movea.l	-$38A4(a5),a0
	addq.l	#$1,-$38A4(a5)
	move.b	(a0),d0
	ext.w	d0
	add.w	d0,$32(a4)
loc_160C36:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
