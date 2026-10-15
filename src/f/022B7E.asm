; ---------------------------------------------------------------------------
; sub_022B7E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_022B7E:
	link.w	a6,#$0
	lea.l	$512(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	lea.l	sub_022A1C(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	sub_0229E8(pc)
	jsr	sub_022B4E(pc)
	unlk	a6
	rts
