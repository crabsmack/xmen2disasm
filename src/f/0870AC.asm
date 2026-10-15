; ---------------------------------------------------------------------------
; sub_0870AC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0870AC:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$2,-$3B0C(a5)
	pea.l	($F5).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F5).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	move.w	#$F,$6C(a4)
	lea.l	sub_0870EA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
