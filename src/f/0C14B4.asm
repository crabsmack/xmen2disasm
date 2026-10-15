; ---------------------------------------------------------------------------
; sub_0C14B4	[jt 1122]
; ---------------------------------------------------------------------------
sub_0C14B4:
	link.w	a6,#$0
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$B,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	unlk	a6
	rts
