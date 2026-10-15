; ---------------------------------------------------------------------------
; FloatBubbleExplode_Init - vtable +$12 constructor: run the parent's Init, then set up a FLOATBUBBLEEXPLODE
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the FLOATBUBBLEEXPLODE descriptor $0AC1B8; TAS frames 31607-31607 (1 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
FloatBubbleExplode_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d3
	moveq	#$0,d0
	move.b	-$3B5A(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_0AC330
	moveq	#$0,d0
	move.b	-$3B5E(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_0AC330
	moveq	#$0,d3
loc_0AC330:
	tst.b	d3
	beq.s	loc_0AC338
	moveq	#$0,d0
	bra.s	loc_0AC33A
loc_0AC338:
	moveq	#$2,d0
loc_0AC33A:
	move.w	d0,d7
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1B7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.b	$42(a4)
	ori.b	#$4,$2E(a4)
	ori.w	#$508A,$6(a4)
	lea.l	$10(a7),a7
	lea.l	$1AD2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	move.w	d7,d1
	or.w	d0,d1
	move.b	d1,$2E(a4)
	lea.l	sub_0AC27C(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
