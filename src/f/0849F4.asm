; ---------------------------------------------------------------------------
; sub_0849F4	[jt 591]
; ---------------------------------------------------------------------------
sub_0849F4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_084A14
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_084A1A
loc_084A14:
	move.w	$A6(a4),$16(a4)
loc_084A1A:
	lea.l	$11EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_084A44(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
