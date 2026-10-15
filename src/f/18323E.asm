; ---------------------------------------------------------------------------
; sub_18323E	[jt 2136]
; ---------------------------------------------------------------------------
sub_18323E:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	tst.b	$1B(a6)
	beq.s	loc_18326C
	pea.l	($99).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($99).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$42AA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	addq.w	#$8,a7
	bra.s	loc_183288
loc_18326C:
	pea.l	($97).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($97).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$42A2(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	addq.w	#$8,a7
loc_183288:
	move.w	d7,d0
	add.w	#$14,d0
	movea.l	$10(a6),a0
	move.w	d0,(a0)
	move.w	d7,d0
	sub.w	#$14,d0
	movea.l	$C(a6),a0
	move.w	d0,(a0)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$14(a6),-(a7)
	jsr	$507A(a5)	; -> sub_1FB142
	addq.w	#$8,a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
