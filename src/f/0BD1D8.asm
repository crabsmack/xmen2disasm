; ---------------------------------------------------------------------------
; sub_0BD1D8	[jt 1031]
; ---------------------------------------------------------------------------
sub_0BD1D8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$1E92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$339A(a5)	; -> sub_11F3E2
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	$3352(a5),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
