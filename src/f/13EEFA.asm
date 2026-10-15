; ---------------------------------------------------------------------------
; ExplodeFx_Chain - kill an object and start a chain explosion along a path at its position (no repeats)
; In:  8(a6) = object  $C(a6) = path  $13(a6) = byte damaging  $16(a6) = word dx  $1A(a6) = word dy
; Out: none
; Evidence: vtable +$52 Kill, ExplodeFx_ChainStart(..., x+dx, y+dy, damaging, path, 0); 8 callers incl. LaserCannon_OnDeath (Tbl_ExplodeFxSpiralPath), BigBio_StateDefeated, Pop types 4/5 (jt 1882)
; ---------------------------------------------------------------------------
ExplodeFx_Chain:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$16(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	d1,-$4(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$1A(a6),d1
	ext.l	d1
	add.l	d0,d1
	move.w	d1,-$2(a6)
	clr.w	d4
	move.b	$42(a4),d4
	move.b	$43(a4),d5
	moveq	#$4,d6
	and.b	$2E(a4),d6
	moveq	#$8,d0
	and.w	$6(a4),d0
	beq.s	loc_13EF46
	moveq	#$1,d0
	bra.s	loc_13EF48
loc_13EF46:
	moveq	#$0,d0
loc_13EF48:
	move.b	d0,d7
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	moveq	#$0,d1
	move.b	$13(a6),d1
	move.l	d1,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	-$4(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.b	d7,d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.b	d6,d1
	move.l	d1,-(a7)
	ext.w	d5
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d1
	move.b	d4,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	ExplodeFx_ChainStart(pc)
	lea.l	$2C(a7),a7
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
