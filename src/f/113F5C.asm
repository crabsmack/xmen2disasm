; ---------------------------------------------------------------------------
; XNpc_HurtReact - XNPC OnHurt body: save the state, hurt sound; hits from the left/right (types 9/10) knock back up to a wall, types 11/12 stun
; In:  8(a6) = this  $F(a6) = byte strength  $13(a6) = byte hit type
; Out: none
; Evidence: called by XNpc_OnHurt; wall probe via vtable +$7A (Query7A); next states XNpc_StateKnockStart / KnockBStart / StunStart; switch Sw_113F5C
; ---------------------------------------------------------------------------
XNpc_HurtReact:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	move.b	$F(a6),d5
	movea.l	$8(a6),a4
	tst.l	$60(a4)
	bne.s	loc_113F78
	move.l	$5C(a4),$60(a4)
loc_113F78:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_113F8E
	moveq	#$63,d0
	bra.s	loc_113F9A
loc_113F8E:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113F9A:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_113FBA
	moveq	#$63,d0
	bra.s	loc_113FC6
loc_113FBA:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	tst.l	d0
loc_113FC6:
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	$13(a6),d0
	subi.b	#$9,d0
	addq.w	#$8,a7
	bmi.w	XNpc_HurtReact_Done
	cmpi.b	#$3,d0
	bgt.w	XNpc_HurtReact_Done
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_113F5C(pc,d1.w),d1
	jmp	Sw_113F5C-2(pc,d1.w)
