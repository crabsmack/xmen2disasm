; ---------------------------------------------------------------------------
; sub_06DE3A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06DE3A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1A0,d7
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_06DE5A
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_06DE5A:
	move.w	d7,$16(a4)
	lea.l	$FF2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	move.w	#$32,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_06DE90(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
