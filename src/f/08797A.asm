; ---------------------------------------------------------------------------
; sub_08797A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_08797A:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	clr.w	d7
	ori.w	#$2,$6(a3)
	pea.l	-$1652(a5)
	move.l	$84(a3),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$84(a3)
	clr.w	d7
	movea.l	-$34A6(a5),a0
	movea.l	(a0),a4
	addq.w	#$8,a7
	bra.s	loc_0879E2
loc_0879AC:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_0879D2
	lea.l	$1502(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0879D2
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0879D2:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0879E2:
	cmp.w	-$13F2(a5),d7
	blt.s	loc_0879AC
	andi.w	#$FFFE,-$3B0C(a5)
	moveq	#$0,d0
	move.l	d0,-$340E(a5)
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
