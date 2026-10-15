; ---------------------------------------------------------------------------
; Music_PlayStage - start a stage music track: stop everything, set the player parameters, g_MusicTrack, parameter 0 and play it
; In:  8(a6) = word track
; Out: none
; Evidence: Snd_StopAll, Music_SetPlayerParams, Snd_SetParam(0, track), Snd_Stop/Snd_Play(track); callers CloneA2_RunScene, SavageB1_RunScene...
; Found: jt 1121
; ---------------------------------------------------------------------------
Music_PlayStage:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	jsr	$5242(a5)	; -> Snd_StopAll
	jsr	Music_SetPlayerParams(pc)
	move.w	d7,g_MusicTrack(a5)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	-$4(a6),d7
	unlk	a6
	rts
