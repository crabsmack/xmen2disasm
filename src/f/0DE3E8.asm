; ---------------------------------------------------------------------------
; sub_0DE3E8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DE3E8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$A,$6A(a4)
	moveq	#$5,d0
	cmp.w	$9A(a4),d0
	addq.w	#$1,$9A(a4)
	move.w	$9A(a4),d0
	subq.w	#$2,d0
	beq.s	loc_0DE414
	subq.w	#$1,d0
	beq.s	loc_0DE43A
	subq.w	#$1,d0
	beq.s	loc_0DE460
	bra.s	loc_0DE474
loc_0DE414:
	pea.l	($CB).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($CB).w
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0DE240(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DE486
loc_0DE43A:
	pea.l	($CB).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($CB).w
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0DE274(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DE486
loc_0DE460:
	clr.w	$6C(a4)
	lea.l	sub_0DE2A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DE486
loc_0DE474:
	clr.w	$6C(a4)
	lea.l	sub_0DE2A8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DE486:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
