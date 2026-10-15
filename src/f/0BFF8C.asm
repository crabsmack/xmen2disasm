; ---------------------------------------------------------------------------
; SwampPlatform_Init - vtable +$12 constructor: run the parent's Init, then set up a SWAMPPLATFORM
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the SWAMPPLATFORM descriptor $0C005A; TAS frames 28314-30421 (12 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
SwampPlatform_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2282(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$283,$6(a4)
	move.w	$4(a3),$12(a4)
	clr.b	$42(a4)
	move.w	-$3C16(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	move.w	-$3C16(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$3886(a5),a0
	move.w	#$6000,d1
	or.w	$6(a0,d0.w),d1
	move.w	d1,$98(a4)
	lea.l	$18(a7),a7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a3,d0
	addq.w	#$8,a7
	beq.s	loc_0C0040
	tst.w	$6(a3)
	beq.s	loc_0C0028
	move.w	$6(a3),d0
	bra.s	loc_0C002A
loc_0C0028:
	moveq	#$0,d0
loc_0C002A:
	move.w	d0,$8C(a4)
	tst.w	$8(a3)
	beq.s	loc_0C003A
	move.w	$8(a3),d0
	bra.s	loc_0C003C
loc_0C003A:
	moveq	#$0,d0
loc_0C003C:
	move.b	d0,$9B(a4)
loc_0C0040:
	clr.b	$9A(a4)
	lea.l	sub_0BFD6E(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
