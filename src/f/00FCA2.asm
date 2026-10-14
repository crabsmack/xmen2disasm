; ---------------------------------------------------------------------------
; sub_00FCA2	[jt 18]
; ---------------------------------------------------------------------------
sub_00FCA2:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$D2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3CDE(a5)
	pea.l	-$3CE0(a5)
	pea.l	-$3CDC(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$DA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3CE4(a5)
	pea.l	-$3CE6(a5)
	pea.l	-$3CE2(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	unlk	a6
	rts
