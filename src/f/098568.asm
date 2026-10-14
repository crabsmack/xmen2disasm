; ---------------------------------------------------------------------------
; sub_098568	[jt 780]
; ---------------------------------------------------------------------------
sub_098568:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_098584
	move.w	#$7,$BA(a4)
	bra.s	loc_09858A
loc_098584:
	move.w	#$2,$BA(a4)
loc_09858A:
	move.w	$BA(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E3A(a5)	; -> sub_1591DE
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_0985BE
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_098468(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0985FC
loc_0985BE:
	tst.l	$98(a4)
	bne.s	loc_0985D0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0985FC
loc_0985D0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0985E4
	clr.w	$96(a4)
loc_0985E4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0985FC:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
