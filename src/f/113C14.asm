; ---------------------------------------------------------------------------
; sub_113C14	[jt 1403]
; ---------------------------------------------------------------------------
sub_113C14:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8C(a4),a0
	move.b	$2(a0),d0
	subq.b	#$1,d0
	lea.l	$C(a7),a7
	beq.s	loc_113C70
	subq.b	#$1,d0
	beq.s	loc_113C66
	subq.b	#$2,d0
	beq.s	loc_113C5C
	subq.b	#$4,d0
	bne.s	loc_113C70
	move.l	a4,-(a7)
	jsr	$3AE2(a5)	; -> sub_13E808
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C5C:
	move.l	a4,-(a7)
	jsr	$3ADA(a5)	; -> sub_13E30E
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C66:
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> sub_13DE36
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C70:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	addq.w	#$4,a7
loc_113C78:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
