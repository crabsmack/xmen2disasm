; ---------------------------------------------------------------------------
; sub_135610	[jt 1777]
; ---------------------------------------------------------------------------
sub_135610:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d7
	asr.l	#$8,d7
	cmp.w	$92(a4),d6
	addq.w	#$4,a7
	beq.s	loc_13563E
	cmp.w	$94(a4),d6
	bne.s	loc_13568C
loc_13563E:
	cmp.w	$92(a4),d7
	blt.s	loc_13564A
	cmp.w	$94(a4),d7
	ble.s	loc_13568C
loc_13564A:
	tst.l	$8E(a4)
	bne.s	loc_13565E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_135700
loc_13565E:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_135672
	clr.w	$8C(a4)
loc_135672:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_135700
loc_13568C:
	lea.l	sub_13463C(pc),a0
	move.l	a0,$9E(a4)
	lea.l	$36E2(a5),a0
	move.l	$2(a0),$A2(a4)
	tst.b	$A6(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1356B0
	move.l	#$FFFFFF7E,d0
	bra.s	loc_1356B6
loc_1356B0:
	move.l	#$82,d0
loc_1356B6:
	move.w	d0,$9A(a4)
	move.w	#$FFE5,$9C(a4)
	moveq	#$0,d0
	move.b	-$3B5C(a5),d0
	cmp.w	-$359C(a5),d0
	beq.s	loc_1356DE
	lea.l	$36CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	bra.s	loc_1356EE
loc_1356DE:
	lea.l	$36D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
loc_1356EE:
	clr.w	$6C(a4)
	lea.l	sub_13570A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_135700:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
