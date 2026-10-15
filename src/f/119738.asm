; ---------------------------------------------------------------------------
; sub_119738	[jt 1489]
; ---------------------------------------------------------------------------
sub_119738:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a3
	pea.l	Str_Empty_119782(pc)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$8(a6),-(a7)
	movea.l	$12(a3),a0
	jsr	(a0)
	ext.l	d0
	addq.l	#$8,a7
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	move.l	a3,(a4)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	movea.l	a3,a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	a4,d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
