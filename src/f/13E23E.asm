; ---------------------------------------------------------------------------
; ExplodeFx_Trail - kill an object and replace it with a trail of explosions left behind by a moving head puff
; In:  8(a6) = object  $E(a6) = word vx  $12(a6) = word vy  $16(a6) = word ax  $1A(a6) = word ay
; Out: d0 = misc
; Evidence: vtable +$52 Kill, ExplodeFx_TrailStart, 10 x ExplodeFx_TrailPuffInit at the object, ExplodeFx_TrailSetHead on puff 0; caller ExplodeFx_TrailArc
; ---------------------------------------------------------------------------
ExplodeFx_Trail:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	clr.w	d7
	move.b	$42(a4),-$3(a6)
	move.b	$43(a4),-$2(a6)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	move.b	d0,-$1(a6)
	moveq	#$8,d0
	and.w	$6(a4),d0
	beq.s	loc_13E276
	moveq	#$1,d0
	bra.s	loc_13E278
loc_13E276:
	moveq	#$0,d0
loc_13E278:
	move.b	d0,d4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	d4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$1(a6),d0
	move.l	d0,-(a7)
	move.b	-$2(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	-$3(a6),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	ExplodeFx_TrailStart(pc)
	movea.l	a4,a3
	lea.l	$E(a3),a3
	lea.l	$18(a7),a7
loc_13E2B4:
	cmpi.w	#$A,d7
	bge.s	loc_13E304
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	move.l	a3,-(a7)
	jsr	ExplodeFx_TrailPuffInit(pc)
	tst.w	d7
	lea.l	$C(a7),a7
	bne.s	loc_13E2FA
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	d5,-(a7)
	move.l	a3,-(a7)
	jsr	ExplodeFx_TrailSetHead(pc)
	lea.l	$1C(a7),a7
loc_13E2FA:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$12(a3),a3
	bra.s	loc_13E2B4
loc_13E304:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
