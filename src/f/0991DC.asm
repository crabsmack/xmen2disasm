; ---------------------------------------------------------------------------
; loc_0991DC
; ---------------------------------------------------------------------------
loc_0991DC:
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$12,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	moveq	#$74,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$74,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	-$35B6(a5),-(a7)
	jsr	sub_099BBE(pc)
	ori.w	#$1,-$3B08(a5)
	clr.b	-$3894(a5)
	move.b	#$1,$B0(a4)
	lea.l	$14(a7),a7
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
