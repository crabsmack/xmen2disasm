; ---------------------------------------------------------------------------
; sub_13D60C	[jt 1862]
; ---------------------------------------------------------------------------
sub_13D60C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_13D636
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	slt.b	d0
	neg.b	d0
	bra.s	loc_13D642
loc_13D636:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	sgt.b	d0
	neg.b	d0
loc_13D642:
	addq.w	#$4,a7
	bne.s	loc_13D65E
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_13D658
	ori.b	#$10,$2E(a4)
	bra.s	loc_13D65E
loc_13D658:
	andi.b	#$EF,$2E(a4)
loc_13D65E:
	lea.l	$3A7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D680
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D6AC
loc_13D680:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D694
	clr.w	$96(a4)
loc_13D694:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_13D6AC:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
