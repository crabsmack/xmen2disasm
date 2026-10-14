; ---------------------------------------------------------------------------
; sub_1FA8DC	[jt 2562]
; ---------------------------------------------------------------------------
sub_1FA8DC:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$8(a6),d6
	jsr	$4172(a5)	; -> sub_1600A0
	movea.l	d0,a4
	movea.l	-$348C(a5),a4
	moveq	#$8,d7
	moveq	#$1,d0
	and.w	d7,d0
	moveq	#$0,d1
	move.w	d0,d1
	ext.l	d7
	add.l	d7,d1
	movea.l	d1,a3
	adda.l	a4,a3
	moveq	#$1,d0
	and.l	d6,d0
	add.l	d6,d0
	add.l	a3,d0
	move.l	d0,-$348C(a5)
	move.l	d0,(a4)
	move.l	$C(a6),$4(a4)
	move.l	a3,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
