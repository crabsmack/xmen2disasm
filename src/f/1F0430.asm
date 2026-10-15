; ---------------------------------------------------------------------------
; sub_1F0430	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F0430:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$52,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	move.w	#$FF,$6C(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F0468
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_1F046E
loc_1F0468:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
loc_1F046E:
	movea.l	d0,a3
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	beq.s	loc_1F0494
	moveq	#$78,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$4,a7
loc_1F0494:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
