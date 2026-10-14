; ---------------------------------------------------------------------------
; sub_138864	[jt 1817]
; ---------------------------------------------------------------------------
sub_138864:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$391A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	ori.w	#$83,$6(a4)
	move.w	$6(a3),d7
	beq.s	loc_1388B0
	move.w	d7,$8C(a4)
	bra.s	loc_1388B6
loc_1388B0:
	move.w	#$80,$8C(a4)
loc_1388B6:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	add.w	d0,$8C(a4)
	move.w	$8(a3),d7
	beq.s	loc_1388CC
	move.w	d7,$8E(a4)
	bra.s	loc_1388D2
loc_1388CC:
	move.w	#$80,$8E(a4)
loc_1388D2:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	add.w	d0,$8E(a4)
	move.w	$A(a3),d7
	beq.s	loc_1388E8
	move.w	d7,$90(a4)
	bra.s	loc_1388EE
loc_1388E8:
	move.w	#$3E9,$90(a4)
loc_1388EE:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
