; ---------------------------------------------------------------------------
; sub_11434A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_11434A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$90(a4),d0
	moveq	#$3,d1
	and.b	d0,d1
	moveq	#$0,d7
	move.b	d1,d7
	cmpi.w	#$2,d7
	bne.s	loc_114374
	addi.l	#$100,$8(a4)
	bra.s	loc_114380
loc_114374:
	tst.w	d7
	bne.s	loc_114380
	subi.l	#$100,$8(a4)
loc_114380:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
