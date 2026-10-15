; ---------------------------------------------------------------------------
; Hologram_OpenExit - open the exit: start the extra palette cycles, sound $D1, change the exit tiles, unlock the camera, camera shake
; In:  8(a6) = this
; Out: none
; Evidence: $FFC61A = 1, Snd_Play($D1), SentinelsA1_OpenExitTiles, g_Camera vtable +$3A, g_CamShake
; ---------------------------------------------------------------------------
Hologram_OpenExit:
	link.w	a6,#$0
	move.b	#$1,-$3BE6(a5)
	pea.l	($D1).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D1).w
	jsr	$521A(a5)	; -> Snd_Play
	jsr	$2832(a5)	; -> SentinelsA1_OpenExitTiles
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	movea.l	$8(a6),a0
	movea.l	$9E(a0),a0
	ori.b	#$40,(a0)
	lea.l	$263A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	clr.w	g_PalBase+$2(a5)
	clr.l	g_PalBase+$42(a5)
	unlk	a6
	rts
