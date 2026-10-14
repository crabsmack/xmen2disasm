; ---------------------------------------------------------------------------
; sub_010B3C	[jt 39]
; ---------------------------------------------------------------------------
sub_010B3C:
	link.w	a6,#$FFFE
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d5
	clr.b	d6
	clr.b	-$1(a6)
	clr.b	d4
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_010BFA
	move.l	-$1750(a5),d7
	asr.l	#$8,d7
	cmpi.w	#$19C0,d7
	ble.s	loc_010BAE
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	bne.s	loc_010BAE
	ori.b	#$4,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_010BAE:
	cmpi.w	#$1900,d7
	bge.s	loc_010BF0
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_010BEA
	andi.b	#$FB,-$172A(a5)
	moveq	#$8,d0
	and.w	-$1752(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1716(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$16D0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_010BEA:
	move.b	#$1,-$1(a6)
loc_010BF0:
	cmpi.w	#$1A5E,d7
	ble.s	loc_010C02
	moveq	#$1,d5
	bra.s	loc_010C02
loc_010BFA:
	moveq	#$1,d5
	move.b	#$1,-$1(a6)
loc_010C02:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_010CA6
	move.l	-$1840(a5),d7
	asr.l	#$8,d7
	cmpi.w	#$19C0,d7
	ble.s	loc_010C5E
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	bne.s	loc_010C5E
	ori.b	#$4,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_010C5E:
	cmpi.w	#$1900,d7
	bge.s	loc_010C9C
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_010C9A
	andi.b	#$FB,-$181A(a5)
	moveq	#$8,d0
	and.w	-$1842(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	-$1806(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	-$17C0(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_010C9A:
	moveq	#$1,d4
loc_010C9C:
	cmpi.w	#$1A5E,d7
	ble.s	loc_010CAA
	moveq	#$1,d6
	bra.s	loc_010CAA
loc_010CA6:
	moveq	#$1,d6
	moveq	#$1,d4
loc_010CAA:
	tst.b	d5
	beq.w	loc_010D5A
	tst.b	d6
	beq.w	loc_010D5A
	jsr	$4F12(a5)	; -> sub_1F7C0A
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a3
	pea.l	($401).w
	pea.l	($1A5F).w
	pea.l	($3AC).w
	pea.l	($1A5F).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	jsr	$4F0A(a5)	; -> sub_1F7BB6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	-$3490(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	pea.l	($1A3C).w
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	lea.l	$38(a7),a7
	bne.s	loc_010D2A
	move.l	$64(a4),$5C(a4)
	move.w	#$78,$6C(a4)
	bra.s	loc_010D6C
loc_010D2A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_010D3E
	clr.w	$96(a4)
loc_010D3E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$78,$6C(a4)
	bra.s	loc_010D6C
loc_010D5A:
	clr.w	$6C(a4)
	lea.l	sub_010B3C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_010D6C:
	movem.l	-$1A(a6),d4-d7/a3-a4
	unlk	a6
	rts
