; ---------------------------------------------------------------------------
; sub_077422	[link-after-rts]
; ---------------------------------------------------------------------------
sub_077422:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$10BA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3A(a5)
	pea.l	-$3B42(a5)
	pea.l	-$3B32(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$10C2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3A(a5)
	pea.l	-$3B42(a5)
	pea.l	-$3B32(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	unlk	a6
	rts
