; ---------------------------------------------------------------------------
; sub_1D0182	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1D0182:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_1CFFEA(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CFFEA(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
