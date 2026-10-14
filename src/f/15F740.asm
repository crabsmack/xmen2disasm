; ---------------------------------------------------------------------------
; sub_15F740
; ---------------------------------------------------------------------------
sub_15F740:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$44(a4),a0
	move.b	(a0),d7
	addq.w	#$1,$48(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$48(a4),d0
	bgt.s	loc_15F784
	moveq	#$0,d0
	move.b	d7,d0
	moveq	#$3,d1
	and.b	d0,d1
	beq.s	loc_15F780
	moveq	#$0,d0
	move.b	d7,d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_15F77A
	clr.w	$6C(a4)
loc_15F77A:
	moveq	#$0,d0
	move.l	d0,$44(a4)
loc_15F780:
	clr.w	$48(a4)
loc_15F784:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
