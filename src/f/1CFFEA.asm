; ---------------------------------------------------------------------------
; sub_1CFFEA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CFFEA:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1D0014
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1D004E
loc_1D0014:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$8A(a0),a1
	jsr	(a1)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D0032
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1D003A
loc_1D0032:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1D003A:
	addq.w	#$4,a7
	bne.s	loc_1D004E
	lea.l	sub_1CFF7E(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFF7E(pc)
	addq.w	#$4,a7
loc_1D004E:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
