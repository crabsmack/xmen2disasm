; ---------------------------------------------------------------------------
; sub_085850	[link-after-rts]
; ---------------------------------------------------------------------------
sub_085850:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8E(a3),a4
	tst.w	$E(a4)
	beq.s	loc_08586A
	jsr	$1172(a5)	; -> sub_08206A
loc_08586A:
	move.w	$8C(a3),d7
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$117A(a5)	; -> sub_0820AE
	moveq	#$0,d7
	addq.w	#$4,a7
loc_08587A:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_08588A
	lea.l	-$1758(a5),a4
	move.l	a4,d0
	bra.s	loc_085890
loc_08588A:
	lea.l	-$1848(a5),a4
	move.l	a4,d0
loc_085890:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0858C8
	move.w	#$A,$6A(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	addq.w	#$4,a7
loc_0858C8:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_08587A
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	$4EA2(a5)	; -> sub_1F690E
	addq.w	#$4,a7
	clr.w	$6C(a3)
	lea.l	sub_0858F6(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
