; ---------------------------------------------------------------------------
; sub_006584	[jt 8]
; ---------------------------------------------------------------------------
sub_006584:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	lea.l	$3F7A(a5),a0
	movea.l	$2(a0),a4
	lea.l	$3F92(a5),a0
	movea.l	$2(a0),a3
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0065CA
	pea.l	($200).w
	move.l	#$FD00,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> sub_1FE17A
	lea.l	$C(a7),a7
	bra.s	loc_0065DE
loc_0065CA:
	pea.l	($140).w
	move.l	#$FD00,-(a7)
	move.l	a3,-(a7)
	jsr	$51DA(a5)	; -> sub_1FE17A
	lea.l	$C(a7),a7
loc_0065DE:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_006610
	adda.w	#$200,a4
	pea.l	($200).w
	move.l	#$FA00,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> sub_1FE17A
	lea.l	$C(a7),a7
	bra.s	loc_006624
loc_006610:
	pea.l	($140).w
	move.l	#$FA00,-(a7)
	move.l	a3,-(a7)
	jsr	$51DA(a5)	; -> sub_1FE17A
	lea.l	$C(a7),a7
loc_006624:
	jsr	sub_006386(pc)
	jsr	$5112(a5)	; -> sub_1FDC5C
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
