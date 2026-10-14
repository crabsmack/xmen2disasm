; ---------------------------------------------------------------------------
; sub_197412	[jt 2170]
; ---------------------------------------------------------------------------
sub_197412:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.s	loc_197438
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_197490
loc_197438:
	lea.l	$43BA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($88).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($88).w
	jsr	$521A(a5)	; -> sub_1FE584
	clr.w	$18(a4)
	move.w	#$B4,$20(a4)
	move.w	#$860,$24(a4)
	move.w	#$6,$6E(a4)
	ori.l	#$2,$90(a4)
	move.b	#$1,-$3892(a5)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_197348(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_197490:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
