; ---------------------------------------------------------------------------
; sub_183AB6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_183AB6:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183ADC
	move.w	g_PadMaskLeft(a5),d1
	and.w	g_Pad1Held(a5),d1
	bra.s	loc_183AE6
loc_183ADC:
	move.w	g_PadMaskLeft(a5),d0
	and.w	g_Pad2Held(a5),d0
	move.w	d0,d1
loc_183AE6:
	beq.s	loc_183AF0
	ori.b	#$10,$2E(a4)
	bra.s	loc_183B14
loc_183AF0:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183B04
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_183B0C
loc_183B04:
	move.w	g_PadMaskRight(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_183B0C:
	beq.s	loc_183B14
	andi.b	#$EF,$2E(a4)
loc_183B14:
	move.l	a4,-(a7)
	jsr	sub_183A3E(pc)
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_183B34
	clr.w	$6C(a4)
	lea.l	sub_183BAE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_183BA4
loc_183B34:
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($92).w
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	($96).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	#$1E,$20(a4)
	move.w	#$FDF4,$18(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_183B74
	move.l	#$FFFFFA00,d0
	bra.s	loc_183B7A
loc_183B74:
	move.l	#$600,d0
loc_183B7A:
	move.w	d0,$16(a4)
	clr.w	$1E(a4)
	move.w	#$600,$22(a4)
	move.w	#$26,$6E(a4)
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_18393C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_183BA4:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
