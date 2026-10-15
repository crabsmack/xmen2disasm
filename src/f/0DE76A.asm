; ---------------------------------------------------------------------------
; sub_0DE76A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DE76A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($D6).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D6).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$1,$6C(a4)
	lea.l	sub_0DE7B2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
