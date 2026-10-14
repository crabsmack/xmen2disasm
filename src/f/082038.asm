; ---------------------------------------------------------------------------
; sub_082038	[link-after-rts]
; ---------------------------------------------------------------------------
sub_082038:
	link.w	a6,#$0
	tst.w	-$3AFA(a5)
	bne.s	loc_082066
	move.l	-$35B6(a5),-(a7)
	jsr	sub_081EDC(pc)
	movea.l	-$35B6(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	move.b	#$1,-$3892(a5)
	move.l	$8(a6),-(a7)
	jsr	$4FEA(a5)	; -> sub_1F9D38
loc_082066:
	unlk	a6
	rts
