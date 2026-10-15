; ---------------------------------------------------------------------------
; sub_0BDB04	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDB04:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	sub_0BD7EA(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0BDB32
	clr.w	$6C(a4)
	lea.l	sub_0BDC9A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDB44
loc_0BDB32:
	clr.w	$6C(a4)
	lea.l	sub_0BDB4C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDB44:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
