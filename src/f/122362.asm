; ---------------------------------------------------------------------------
; sub_122362	[link-after-rts]
; ---------------------------------------------------------------------------
sub_122362:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FD).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($FD).w
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_12232C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
