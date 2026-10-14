; ---------------------------------------------------------------------------
; sub_0EC6E0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EC6E0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1758(a5)
	move.l	a4,-(a7)
	jsr	sub_0EC534(pc)
	tst.b	d0
	addq.w	#$8,a7
	bne.s	loc_0EC70A
	pea.l	-$1848(a5)
	move.l	a4,-(a7)
	jsr	sub_0EC534(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0EC724
loc_0EC70A:
	move.b	#$1,$92(a4)
	clr.w	$6C(a4)
	lea.l	sub_0EC5B0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0EC738
loc_0EC724:
	move.w	#$FF,$6C(a4)
	lea.l	sub_0EC6E0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EC738:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
