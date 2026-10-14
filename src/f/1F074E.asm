; ---------------------------------------------------------------------------
; sub_1F074E	[jt 2420]
; ---------------------------------------------------------------------------
sub_1F074E:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$94(a4),a3
	tst.b	$12(a3)
	blt.s	loc_1F0794
	move.l	a4,-(a7)
	move.b	$12(a3),d0
	ext.w	d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F077A
	moveq	#$0,d0
	bra.s	loc_1F078C
loc_1F077A:
	move.b	$12(a3),d0
	ext.w	d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_1F078C:
	move.l	d0,-(a7)
	jsr	$4E72(a5)	; -> sub_1F64B4
	addq.w	#$8,a7
loc_1F0794:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	#$3C,$6A(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
