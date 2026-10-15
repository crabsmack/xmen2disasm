; ---------------------------------------------------------------------------
; sub_0FD6A8	[jt 1325]
; ---------------------------------------------------------------------------
sub_0FD6A8:
	link.w	a6,#$0
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$1F,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1F,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	sub_0FD69C(pc)
	lea.l	sub_0FCC6A(pc),a0
	move.l	a0,-$38E8(a5)
	lea.l	sub_0FCC86(pc),a0
	move.l	a0,-$38EC(a5)
	jsr	sub_0FD576(pc)
	jsr	sub_0FD614(pc)
	jsr	sub_0FD69C(pc)
	move.b	#$1,-$3ABA(a5)
	clr.b	g_PalBaseDirty(a5)
	jsr	$2322(a5)	; -> sub_0C1412
	move.w	#$27,g_MusicTrack(a5)
	moveq	#$27,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$27,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$2332(a5)	; -> sub_0C14B4
	unlk	a6
	rts
