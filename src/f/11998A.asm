; ---------------------------------------------------------------------------
; sub_11998A	[jt 1500]
; ---------------------------------------------------------------------------
sub_11998A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	move.l	-$10F0(a5),-(a7)
	jsr	$4FEA(a5)	; -> sub_1F9D38
	movea.l	-$4(a6),a4
	unlk	a6
	rts
