; ---------------------------------------------------------------------------
; sub_0BDCFE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDCFE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,$BF(a4)
	move.l	a4,-(a7)
	jsr	sub_0BD75C(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BDD34
	ori.w	#$4000,$6(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BE2CE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDD4A
loc_0BDD34:
	clr.b	$BC(a4)
	clr.w	$6C(a4)
	lea.l	sub_0BDD52(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDD4A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
