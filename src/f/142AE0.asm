; ---------------------------------------------------------------------------
; sub_142AE0	[jt 1936]
; ---------------------------------------------------------------------------
sub_142AE0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	sub_1422A0(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3D0A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A6E(a5)
	pea.l	$142B52(pc)
	pea.l	($100).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$1A6C(a5)
	movea.l	d0,a0
	lea.l	(a0),a4
	lea.l	$10(a7),a7
	bra.s	loc_142B20
loc_142B18:
	clr.b	$E(a4)
	lea.l	$10(a4),a4
loc_142B20:
	movea.l	-$1A6C(a5),a0
	lea.l	$100(a0),a0
	cmpa.l	a4,a0
	bhi.s	loc_142B18
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	-$1A6C(a5),-(a7)
	move.l	d0,-(a7)
	pea.l	sub_14304E(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	lea.l	$10(a7),a7
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
