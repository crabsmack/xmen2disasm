; ---------------------------------------------------------------------------
; sub_006636	[jt 9]
; ---------------------------------------------------------------------------
sub_006636:
	link.w	a6,#$0
	lea.l	$4232(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$422A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4222(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$421A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5212(a5)	; -> sub_1FE544
	clr.b	g_SceneCount(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	unlk	a6
	rts
