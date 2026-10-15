; ---------------------------------------------------------------------------
; sub_0B6EA6	[jt 926]
; ---------------------------------------------------------------------------
sub_0B6EA6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_0B6EDA
	ori.b	#$10,$2E(a4)
	bra.s	loc_0B6EE0
loc_0B6EDA:
	andi.b	#$EF,$2E(a4)
loc_0B6EE0:
	tst.l	$A0(a4)
	bne.s	loc_0B6EF2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0B6F1E
loc_0B6EF2:
	addq.w	#$1,$9E(a4)
	movea.l	$A0(a4),a0
	move.w	$9E(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B6F06
	clr.w	$9E(a4)
loc_0B6F06:
	movea.l	$A0(a4),a0
	addq.l	#$2,a0
	move.w	$9E(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0B6F1E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
