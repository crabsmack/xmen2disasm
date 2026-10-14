; ---------------------------------------------------------------------------
; sub_1E3278	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1E3278:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3298
	move.w	-$3BA8(a5),d0
	and.w	-$3A2A(a5),d0
	bra.s	loc_1E32A0
loc_1E3298:
	move.w	-$3BA8(a5),d0
	and.w	-$3A2C(a5),d0
loc_1E32A0:
	beq.s	loc_1E32DA
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$4A72(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	sub_1E2CFC(pc)
	lea.l	$4A1A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1E3246(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1E32E2
loc_1E32DA:
	move.l	a4,-(a7)
	jsr	$4CFA(a5)	; -> sub_1F31F0
	addq.w	#$4,a7
loc_1E32E2:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
