; ---------------------------------------------------------------------------
; sub_0ADC26	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ADC26:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	$9C(a4),a0
	addq.w	#$2,$A(a0)
	movea.l	$9C(a4),a0
	addq.w	#$2,$E(a0)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.s	loc_0ADC88
	move.l	-$16E2(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADC88
	addi.l	#$200,-$174C(a5)
	pea.l	g_Player1(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_0ADC88:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0ADCBC
	move.l	-$17D2(a5),d0
	cmp.l	$9C(a4),d0
	bne.s	loc_0ADCBC
	addi.l	#$200,-$183C(a5)
	pea.l	g_Player2(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_0ADCBC:
	move.w	#$19,$6C(a4)
	lea.l	sub_0ADCD8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
