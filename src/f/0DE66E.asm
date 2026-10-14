; ---------------------------------------------------------------------------
; sub_0DE66E	[jt 1202]
; ---------------------------------------------------------------------------
sub_0DE66E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$25BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	move.l	$94(a4),-(a7)
	jsr	$4F22(a5)	; -> sub_1F7CFE
	moveq	#$0,d0
	move.l	d0,$94(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
