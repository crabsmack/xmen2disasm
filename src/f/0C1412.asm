; ---------------------------------------------------------------------------
; Music_SetPlayerParams - tell the sound driver how many players there are and which characters (parameters $A, $B, $C)
; In:  none
; Out: none
; Evidence: Snd_SetParam($A, count), ($B, P1 voice), ($C, P2 voice); 2269 TAS frames
; Found: jt 1120
; ---------------------------------------------------------------------------
Music_SetPlayerParams:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	pea.l	g_Player1(a5)
	jsr	Player_MusicVoice(pc)
	move.w	d0,d6
	pea.l	g_Player2(a5)
	jsr	Player_MusicVoice(pc)
	move.w	d0,d7
	tst.w	d6
	beq.s	loc_0C1436
	moveq	#$1,d0
	bra.s	loc_0C1438
loc_0C1436:
	moveq	#$0,d0
loc_0C1438:
	tst.w	d7
	beq.s	loc_0C1440
	moveq	#$1,d1
	bra.s	loc_0C1442
loc_0C1440:
	moveq	#$0,d1
loc_0C1442:
	add.b	d1,d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$B,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$C,d0
	move.l	d0,-(a7)
	jsr	$524A(a5)	; -> Snd_SetParam
	lea.l	$20(a7),a7
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
