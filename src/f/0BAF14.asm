; ---------------------------------------------------------------------------
; sub_0BAF14	[jt 992]
; ---------------------------------------------------------------------------
sub_0BAF14:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_0BAF48
	ori.b	#$10,$2E(a4)
	bra.s	loc_0BAF4E
loc_0BAF48:
	andi.b	#$EF,$2E(a4)
loc_0BAF4E:
	tst.l	$98(a4)
	bne.s	loc_0BAF60
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BAF8C
loc_0BAF60:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BAF74
	clr.w	$96(a4)
loc_0BAF74:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BAF8C:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
