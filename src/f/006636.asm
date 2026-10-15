; ---------------------------------------------------------------------------
; Game_Init - one-time game init: start the sound driver with its data, clear the scene registry, no characters selected
; In:  none
; Out: none
; Evidence: jt 9, called once from init sub_1F9850 at TAS frame 5; sub_1FE544 (sound module) with 4 data pointers; clears g_SceneCount; g_P1CharIndex = g_P2CharIndex = $FF
; ---------------------------------------------------------------------------
Game_Init:
	link.w	a6,#$0
	lea.l	$4232(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$422A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4222(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$421A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5212(a5)	; -> Snd_Init
	clr.b	g_SceneCount(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	dc.w	$1B7C,$FFFF,$C445	; insn: move.b #$ff, -$3bbb(a5)
	unlk	a6
	rts
