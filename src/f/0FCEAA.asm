; ---------------------------------------------------------------------------
; sub_0FCEAA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FCEAA:
	link.w	a6,#$0
	tst.w	-$3B10(a5)
	beq.s	loc_0FCEDA
	moveq	#$14,d0
	move.l	d0,-(a7)
	subq.w	#$1,-$3B10(a5)
	move.w	-$3B10(a5),d1
	ext.l	d1
	movea.l	-$3B24(a5),a0
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> sub_1F48AA
loc_0FCEDA:
	unlk	a6
	rts
