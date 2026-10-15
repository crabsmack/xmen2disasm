; ---------------------------------------------------------------------------
; sub_0E9D3A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9D3A:
	link.w	a6,#$0
	move.b	#$1,-$3BE6(a5)
	pea.l	($D1).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D1).w
	jsr	$521A(a5)	; -> Snd_Play
	jsr	$2832(a5)	; -> sub_0EB670
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	movea.l	$8(a6),a0
	movea.l	$9E(a0),a0
	ori.b	#$40,(a0)
	lea.l	$263A(a5),a0
	move.l	$2(a0),-$38A4(a5)
	clr.w	-$397E(a5)
	clr.l	-$393E(a5)
	unlk	a6
	rts
