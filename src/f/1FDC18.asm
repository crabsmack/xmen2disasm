; ---------------------------------------------------------------------------
; sub_1FDC18	[jt 2589]
; ---------------------------------------------------------------------------
sub_1FDC18:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	-$BC6(a5),a4
	tst.l	-$3A44(a5)
	beq.s	loc_1FDC54
	jsr	$416A(a5)	; -> sub_15FD0E
	movea.l	-$3A44(a5),a0
	moveq	#$32,d0
	cmp.b	(a0),d0
	beq.s	loc_1FDC50
	pea.l	($380).w
	move.l	#$F400,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> sub_1FE17A
	jsr	$4DF2(a5)	; -> sub_1F5228
	lea.l	$C(a7),a7
	bra.s	loc_1FDC54
loc_1FDC50:
	jsr	$4DFA(a5)	; -> sub_1F523E
loc_1FDC54:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
