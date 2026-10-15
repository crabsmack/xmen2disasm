; ---------------------------------------------------------------------------
; SavageBio_StateRetractStart - SAVAGE bio state: start retracting the tentacle (sound $F1)
; In:  8(a6) = this
; Out: d0
; Evidence: also a script action (jt); next SavageBio_StateRetract
; Found: jt 999
; ---------------------------------------------------------------------------
SavageBio_StateRetractStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($F1).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F1).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	SavageBio_StateRetract(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
