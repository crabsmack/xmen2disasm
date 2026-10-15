; ---------------------------------------------------------------------------
; sub_1607AA	[jt 2096]
; ---------------------------------------------------------------------------
sub_1607AA:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	pea.l	Str_Empty_1607E6(pc)
	movea.l	$6(a3),a0
	jsr	(a0)
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	move.l	a3,(a4)
	move.l	$C(a6),$1C(a4)
	move.l	a4,-(a7)
	movea.l	a3,a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
