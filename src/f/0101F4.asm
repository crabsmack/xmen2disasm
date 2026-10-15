; ---------------------------------------------------------------------------
; BigAcolyte_Init - vtable +$12 constructor: run the parent's Init(x, y, param), then set up a BIGACOLYTE
; In:  8(a6) = this (BIGACOLYTE object)
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$12 (tools/classes.py); TAS frames 13007-13007 (1 active)
; ---------------------------------------------------------------------------
BigAcolyte_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	#$18,$68(a4)
	move.b	#$1,$70(a4)
	lea.l	$202(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$1EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$98(a4)
	bne.s	loc_010264
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_010280
loc_010264:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_010280:
	ori.w	#$1082,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0102B6
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0102AE
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102AE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0102FC
loc_0102B6:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0102E6
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_0102DE
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102DE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0102FC
loc_0102E6:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0102F6
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102F6:
	andi.b	#$FB,$2E(a4)
loc_0102FC:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$9C(a4)
	move.w	#$280,$24(a4)
	move.w	#$FD80,$28(a4)
	clr.w	$9E(a4)
	move.b	#$1,$A7(a4)
	move.b	#$1,$A6(a4)
	clr.w	$A8(a4)
	move.w	#$3E8,$6E(a4)
	clr.w	$A0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
