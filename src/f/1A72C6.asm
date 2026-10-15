; ---------------------------------------------------------------------------
; sub_1A72C6	[jt 2202]
; ---------------------------------------------------------------------------
sub_1A72C6:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.s	loc_1A72F0
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1A73A8
loc_1A72F0:
	pea.l	($84).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($84).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$18(a4)
	move.w	#$B4,$20(a4)
	move.w	#$860,$24(a4)
	move.w	#$6,$6E(a4)
	ori.l	#$2,$90(a4)
	ori.l	#$1,$90(a4)
	move.b	#$1,-$3892(a5)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1A7340
	move.w	-$3B9C(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1A7348
loc_1A7340:
	move.w	-$3B9C(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1A7348:
	addq.w	#$8,a7
	beq.s	loc_1A737E
	lea.l	$449A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1A736A
	move.l	#$FFFFFF6A,d0
	bra.s	loc_1A7370
loc_1A736A:
	move.l	#$96,d0
loc_1A7370:
	move.w	d0,$1E(a4)
	move.w	#$730,$22(a4)
	addq.w	#$8,a7
	bra.s	loc_1A7396
loc_1A737E:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$4492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
loc_1A7396:
	clr.w	$6C(a4)
	lea.l	sub_1A71EE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1A73A8:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
