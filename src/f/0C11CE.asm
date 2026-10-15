; ---------------------------------------------------------------------------
; sub_0C11CE	[jt 1118]
; ---------------------------------------------------------------------------
sub_0C11CE:
	link.w	a6,#$0
	jsr	sub_0C0DBA(pc)
	jsr	sub_0C0E54(pc)
	jsr	sub_0C0EE0(pc)
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	jsr	sub_0C11B6(pc)
	jsr	sub_0C0ED4(pc)
	jsr	sub_0C0E16(pc)
	pea.l	($520).w
	pea.l	($528).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0C0DC2(pc)
	jsr	$5002(a5)	; -> Level_Run
	jsr	sub_0C14B4(pc)
	unlk	a6
	rts
