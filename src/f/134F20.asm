; ---------------------------------------------------------------------------
; sub_134F20	[link-after-rts]
; ---------------------------------------------------------------------------
sub_134F20:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_134F48
	ori.b	#$10,$2E(a4)
	bra.s	loc_134F4E
loc_134F48:
	andi.b	#$EF,$2E(a4)
loc_134F4E:
	tst.w	$6E(a4)
	bgt.s	loc_134F92
	tst.l	$8E(a4)
	bne.s	loc_134F66
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_134F92
loc_134F66:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_134F7A
	clr.w	$8C(a4)
loc_134F7A:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_134F92:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
