; ---------------------------------------------------------------------------
; sub_1831D0	[jt 2135]
; ---------------------------------------------------------------------------
sub_1831D0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.l	$90(a4),d0
	beq.s	loc_1831F6
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_183236
loc_1831F6:
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	ori.l	#$4,$90(a4)
	lea.l	$4262(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($BD).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($BD).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$4C9A(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	lea.l	$10(a7),a7
loc_183236:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
