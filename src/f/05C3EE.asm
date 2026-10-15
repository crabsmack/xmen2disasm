; ---------------------------------------------------------------------------
; sub_05C3EE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C3EE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	sub_05C1B2(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05C412
	lea.l	sub_05C41A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C412:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
