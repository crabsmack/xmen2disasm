; ---------------------------------------------------------------------------
; sub_0BCED6	[jt 1028]
; ---------------------------------------------------------------------------
sub_0BCED6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3402(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	#$3C,$6E(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BCF04
	move.l	#$FFFFFF00,d0
	bra.s	loc_0BCF0A
loc_0BCF04:
	move.l	#$100,d0
loc_0BCF0A:
	move.w	d0,$16(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BCF2A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
