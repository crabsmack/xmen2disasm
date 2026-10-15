; ---------------------------------------------------------------------------
; sub_02D4BA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D4BA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$6AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	moveq	#$0,d0
	move.b	$A5(a4),d0
	move.l	d0,-(a7)
	move.l	$C(a4),d0
	sub.l	#$4600,d0
	move.l	d0,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$6E2(a5)	; -> sub_02E526
	pea.l	($E0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E0).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.b	$AC(a4)
	lea.l	$1C(a7),a7
	move.w	#$1E,$6C(a4)
	lea.l	sub_02D522(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
