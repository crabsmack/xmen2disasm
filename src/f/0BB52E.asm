; ---------------------------------------------------------------------------
; SavageBio_ActExtendTentacle - SAVAGE bio script action: extend the tentacle along path jt[$2062] (frame $42, sound $F0)
; In:  8(a6) = this
; Out: d0
; Evidence: +$B0 = path, +$AE >= 1; next SavageBio_StateExtend
; Found: jt 997
; ---------------------------------------------------------------------------
SavageBio_ActExtendTentacle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$42,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($F0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F0).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$1E62(a5),a0
	move.l	$2(a0),$B0(a4)
	tst.w	$AE(a4)
	lea.l	$10(a7),a7
	bne.s	loc_0BB576
	move.w	#$1,$AE(a4)
loc_0BB576:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateExtend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
