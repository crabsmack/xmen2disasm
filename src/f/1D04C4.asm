; ---------------------------------------------------------------------------
; sub_1D04C4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1D04C4:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D04E4
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1D04EC
loc_1D04E4:
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
loc_1D04EC:
	beq.s	loc_1D0518
	lea.l	$48AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$4,$C2(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_1CFB14(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1D0520
loc_1D0518:
	move.l	a4,-(a7)
	jsr	$4CFA(a5)	; -> sub_1F31F0
	addq.w	#$4,a7
loc_1D0520:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
