; ---------------------------------------------------------------------------
; sub_144CAA	[jt 1955]
; ---------------------------------------------------------------------------
sub_144CAA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$165A(a5)
	move.l	$8C(a4),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	move.l	a4,-(a7)
	lea.l	$3D5A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
