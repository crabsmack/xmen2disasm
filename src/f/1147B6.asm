; ---------------------------------------------------------------------------
; XNpc_StateKnockBSlide - XNPC knockback B: slide until the target x is passed, then a 20-frame drift
; In:  8(a6) = this
; Out: d0
; Evidence: +$6E = 20; next KnockBExpire
; ---------------------------------------------------------------------------
XNpc_StateKnockBSlide:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$91(a4)
	ble.s	loc_1147EE
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$92(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bge.s	loc_1147EE
	move.w	#$14,$6E(a4)
	lea.l	XNpc_StateKnockBExpire(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XNpc_StateKnockBExpire(pc)
	addq.w	#$4,a7
	bra.s	loc_114858
loc_1147EE:
	tst.b	$91(a4)
	bge.s	loc_11481C
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	$92(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	ble.s	loc_11481C
	move.w	#$14,$6E(a4)
	lea.l	XNpc_StateKnockBExpire(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XNpc_StateKnockBExpire(pc)
	addq.w	#$4,a7
	bra.s	loc_114858
loc_11481C:
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$1C(a4),d0
	add.w	d0,$1A(a4)
	tst.b	-$38DE(a5)
	beq.s	loc_114846
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$1C(a4),d0
	add.w	d0,$1A(a4)
loc_114846:
	clr.w	$6C(a4)
	lea.l	XNpc_StateKnockBSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_114858:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
