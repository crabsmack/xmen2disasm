; ---------------------------------------------------------------------------
; sub_14205E	[jt 1924]
; ---------------------------------------------------------------------------
sub_14205E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_142088
	move.w	$9E(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_14208E
loc_142088:
	move.w	$9E(a4),d0
	ext.l	d0
loc_14208E:
	move.w	d0,$16(a4)
	tst.l	$96(a4)
	addq.w	#$8,a7
	bne.s	loc_1420A8
	move.l	$64(a4),$5C(a4)
	move.w	$A0(a4),$6C(a4)
	bra.s	loc_1420D6
loc_1420A8:
	addq.w	#$1,$94(a4)
	movea.l	$96(a4),a0
	move.w	$94(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_1420BC
	clr.w	$94(a4)
loc_1420BC:
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	$A0(a4),$6C(a4)
loc_1420D6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
