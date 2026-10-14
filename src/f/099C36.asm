; ---------------------------------------------------------------------------
; sub_099C36	[link-after-rts]
; ---------------------------------------------------------------------------
sub_099C36:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	subq.w	#$1,d0
	beq.s	loc_099C60
	subq.w	#$1,d0
	beq.s	loc_099C56
	subq.w	#$1,d0
	bne.s	loc_099C60
	lea.l	$195A(a5),a0
	movea.l	$2(a0),a4
	bra.s	loc_099C68
loc_099C56:
	lea.l	$1952(a5),a0
	movea.l	$2(a0),a4
	bra.s	loc_099C68
loc_099C60:
	lea.l	$194A(a5),a0
	movea.l	$2(a0),a4
loc_099C68:
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	pea.l	-$3940(a5)
	jsr	$4DAA(a5)	; -> sub_1F48AA
	move.b	#$1,-$3A06(a5)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
