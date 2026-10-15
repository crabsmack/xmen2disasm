; ---------------------------------------------------------------------------
; sub_0AB7A8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0AB7A8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	pea.l	($B9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($B9).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	move.w	#$A,$6C(a4)
	lea.l	sub_0AB7EC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
