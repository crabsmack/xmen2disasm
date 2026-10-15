; ---------------------------------------------------------------------------
; sub_183E1A	[jt 2140]
; ---------------------------------------------------------------------------
sub_183E1A:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183E58
	move.w	-$3B9A(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_183E60
loc_183E58:
	move.w	-$3B9A(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_183E60:
	addq.w	#$8,a7
	beq.s	loc_183E6C
	andi.b	#$EF,$2E(a4)
	bra.s	loc_183E90
loc_183E6C:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_183E80
	move.w	-$3B98(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_183E88
loc_183E80:
	move.w	-$3B98(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_183E88:
	beq.s	loc_183E90
	ori.b	#$10,$2E(a4)
loc_183E90:
	move.w	#$3C,$A6(a4)
	clr.w	$6C(a4)
	lea.l	sub_183BAE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
