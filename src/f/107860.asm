; ---------------------------------------------------------------------------
; Switch_FindAndToggle - switch search timer: check 10 placements per frame; for the SWITCH at the tile toggle its BBoard flag $200, play sounds, flip the tile, then debounce
; In:  8(a6) = search state {ptr, end, x, y, frame}
; Out: none
; Evidence: Tbl_Switch_vtable via g_ClassList; g_BBoard +6 + idx*2; Snd_Play $38 + $10 (on) / $16 (off); Map_SetBlockFG tile +/-1; next Switch_DebounceWait
; ---------------------------------------------------------------------------
Switch_FindAndToggle:
	link.w	a6,#$FFFA
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$8(a3),d6
	move.w	$A(a3),d7
	moveq	#$A,d4
	bra.w	loc_1079C8
loc_10787A:
	movea.l	(a3),a4
	moveq	#$10,d0
	add.l	d0,(a3)
	cmpa.l	$4(a3),a4
	bls.s	loc_107898
	move.l	g_TimerCurrent(a5),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	clr.b	g_SwitchSearchBusy(a5)
	addq.w	#$4,a7
	bra.w	loc_1079CE
loc_107898:
	move.w	(a4),d0
	ext.l	d0
	movea.l	g_ClassList(a5),a0
	asl.l	#$2,d0
	lea.l	$2A4A(a5),a1
	move.l	$2(a0,d0.l),d0
	cmp.l	$2(a1),d0
	bne.w	loc_1079C6
	move.w	$2(a4),d0
	asr.w	#$5,d0
	cmp.w	d0,d6
	bne.w	loc_1079C6
	move.w	$4(a4),d0
	asr.w	#$5,d0
	cmp.w	d0,d7
	bne.w	loc_1079C6
	ext.l	d7
	movea.l	g_FgRowTable(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d1
	and.w	(a0,d0.l),d1
	move.w	d1,-$2(a6)
	move.w	$8(a4),d0
	ext.l	d0
	movea.l	g_BBoard(a5),a0
	add.l	d0,d0
	move.w	#$200,d5
	and.w	$6(a0,d0.l),d5
	tst.w	d5
	seq.b	d3
	neg.b	d3
	ext.w	d3
	move.w	d3,d5
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	d5
	addq.w	#$8,a7
	beq.s	loc_10796C
	move.w	$8(a4),d0
	ext.l	d0
	movea.l	g_BBoard(a5),a0
	add.l	d0,d0
	lea.l	$6(a0,d0.l),a0
	move.l	a0,-$6(a6)
	ori.w	#$200,(a0)
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	addq.l	#$1,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	lea.l	$18(a7),a7
	bra.s	loc_1079B2
loc_10796C:
	move.w	$8(a4),d0
	ext.l	d0
	movea.l	g_BBoard(a5),a0
	add.l	d0,d0
	lea.l	$6(a0,d0.l),a0
	move.l	a0,-$6(a6)
	andi.w	#$FDFF,(a0)
	moveq	#$16,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$16,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$2(a6),d1
	ext.l	d1
	subq.l	#$1,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	lea.l	$18(a7),a7
loc_1079B2:
	move.w	g_FrameCounter+2(a5),$C(a3)
	lea.l	Switch_DebounceWait(pc),a0
	movea.l	g_TimerCurrent(a5),a1
	move.l	a0,$C(a1)
	bra.s	loc_1079CE
loc_1079C6:
	subq.w	#$1,d4
loc_1079C8:
	tst.w	d4
	bne.w	loc_10787A
loc_1079CE:
	movem.l	-$22(a6),d3-d7/a3-a4
	unlk	a6
	rts
