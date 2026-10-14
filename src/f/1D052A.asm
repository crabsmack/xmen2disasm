; ---------------------------------------------------------------------------
; sub_1D052A	[jt 2347]
; ---------------------------------------------------------------------------
sub_1D052A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$EA(a0),a1
	jsr	(a1)
	lea.l	sub_1D04C4(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1D04C4(pc)
	addq.w	#$8,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
