; ---------------------------------------------------------------------------
; sub_1FA05A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FA05A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	tst.w	-$359A(a5)
	bne.s	loc_1FA0A6
	tst.l	-$1652(a5)
	beq.s	loc_1FA086
	movea.l	-$165E(a5),a4
	bra.s	loc_1FA082
loc_1FA072:
	move.l	-$1652(a5),-(a7)
	move.l	$8(a4),-(a7)
	jsr	sub_1F9F0E(pc)
	movea.l	(a4),a4
	addq.w	#$8,a7
loc_1FA082:
	move.l	a4,d0
	bne.s	loc_1FA072
loc_1FA086:
	tst.l	-$165A(a5)
	beq.s	loc_1FA0A6
	movea.l	-$1656(a5),a4
	bra.s	loc_1FA0A2
loc_1FA092:
	move.l	-$165A(a5),-(a7)
	move.l	$8(a4),-(a7)
	jsr	sub_1F9F0E(pc)
	movea.l	(a4),a4
	addq.w	#$8,a7
loc_1FA0A2:
	move.l	a4,d0
	bne.s	loc_1FA092
loc_1FA0A6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
