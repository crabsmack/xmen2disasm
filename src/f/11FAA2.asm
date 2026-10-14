; ---------------------------------------------------------------------------
; sub_11FAA2	[jt 1653]
; ---------------------------------------------------------------------------
sub_11FAA2:
	link.w	a6,#$FFF2
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.b	#$1,-$C(a6)
	move.b	#$1,-$B(a6)
	movea.l	$92(a3),a0
	move.w	(a0),-$E(a6)
	andi.w	#$FFFE,$98(a3)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
loc_11FADC:
	movea.l	$92(a3),a4
	addq.w	#$2,a4
	clr.w	-$2(a6)
	move.w	$A6(a3),d4
	clr.w	d7
	bra.w	loc_11FC34
loc_11FAF0:
	move.w	-$2(a6),d0
	ext.l	d0
	ext.l	d4
	move.l	d4,d1
	moveq	#$40,d2
	add.l	d2,d1
	and.l	#$FF,d1
	cmpi.l	#$80,d1
	scs.b	d3
	neg.b	d3
	beq.s	loc_11FB28
	ext.l	d4
	move.l	d4,d1
	add.l	d2,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	bra.s	loc_11FB42
loc_11FB28:
	ext.l	d4
	move.l	d4,d1
	moveq	#$40,d2
	add.l	d2,d1
	and.l	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	neg.l	d1
loc_11FB42:
	asr.l	#$8,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$6(a6),d0
	move.w	d0,-$A(a6)
	move.w	-$2(a6),d0
	ext.l	d0
	move.w	d4,d1
	and.w	#$FF,d1
	moveq	#$0,d2
	move.w	d1,d2
	cmpi.w	#$80,d2
	scs.b	d3
	neg.b	d3
	beq.s	loc_11FB80
	move.w	d4,d1
	and.w	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	bra.s	loc_11FB92
loc_11FB80:
	move.w	d4,d1
	and.w	#$7F,d1
	asl.w	#$2,d1
	lea.l	-$1C9C(a5),a0
	move.l	(a0,d1.w),d1
	neg.l	d1
loc_11FB92:
	asr.l	#$8,d1
	jsr	$3F9A(a5)	; -> sub_15C1FC
	swap	d0
	ext.l	d0
	add.w	-$4(a6),d0
	move.w	d0,-$8(a6)
	move.w	#$100,d0
	and.w	$98(a3),d0
	beq.s	loc_11FC18
	move.w	-$A(a6),d5
	sub.w	(a4),d5
	move.w	-$8(a6),d6
	sub.w	$2(a4),d6
	tst.w	d5
	bne.s	loc_11FBC4
	tst.w	d6
	beq.s	loc_11FC22
loc_11FBC4:
	cmpi.w	#$FFFB,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FBD2
	moveq	#-$5,d0
	bra.s	loc_11FBD4
loc_11FBD2:
	move.w	d5,d0
loc_11FBD4:
	move.w	d0,d5
	cmpi.w	#$5,d5
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FBE4
	move.w	d5,d0
	bra.s	loc_11FBE6
loc_11FBE4:
	moveq	#$5,d0
loc_11FBE6:
	move.w	d0,d5
	cmpi.w	#$FFFB,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FBF6
	moveq	#-$5,d0
	bra.s	loc_11FBF8
loc_11FBF6:
	move.w	d6,d0
loc_11FBF8:
	move.w	d0,d6
	cmpi.w	#$5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_11FC08
	move.w	d6,d0
	bra.s	loc_11FC0A
loc_11FC08:
	moveq	#$5,d0
loc_11FC0A:
	move.w	d0,d6
	add.w	d5,(a4)
	add.w	d6,$2(a4)
	clr.b	-$C(a6)
	bra.s	loc_11FC22
loc_11FC18:
	move.w	-$A(a6),(a4)
	move.w	-$8(a6),$2(a4)
loc_11FC22:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	addi.w	#$19,d4
	move.w	$A8(a3),d0
	add.w	d0,-$2(a6)
loc_11FC34:
	moveq	#$0,d0
	move.w	d7,d0
	move.w	-$E(a6),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.w	loc_11FAF0
	tst.b	-$C(a6)
	beq.s	loc_11FC50
	andi.w	#$FEFF,$98(a3)
loc_11FC50:
	move.w	#$100,d0
	and.w	$98(a3),d0
	bne.s	loc_11FC9A
	move.w	#$200,d0
	and.w	$98(a3),d0
	beq.s	loc_11FC86
	cmpi.w	#$160,$A8(a3)
	ble.s	loc_11FC72
	subi.w	#$18,$A8(a3)
loc_11FC72:
	cmpi.w	#$160,$A8(a3)
	bgt.s	loc_11FC86
	move.w	#$160,$A8(a3)
	andi.w	#$FDFF,$98(a3)
loc_11FC86:
	addi.w	#$19,$A6(a3)
	cmpi.w	#$100,$A6(a3)
	blt.s	loc_11FC9A
	subi.w	#$100,$A6(a3)
loc_11FC9A:
	move.w	$E(a6),d0
	subq.w	#$1,$E(a6)
	tst.w	$E(a6)
	bgt.w	loc_11FADC
	move.b	-$B(a6),d0
	movem.l	-$2A(a6),d3-d7/a3-a4
	unlk	a6
	rts
