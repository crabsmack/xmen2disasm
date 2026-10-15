; ---------------------------------------------------------------------------
; Cerebro_RunTextScript - interpret a Cerebro text script: print lines, move the cursor, wait, clear the window, fade out, play/stop sounds
; In:  -$3B14 = script pointer
; Out: none
; Evidence: op bytes: 0/7+ text (style = op-7), 1 set cursor, 2 wait N frames (button skips), 3 clear window + set cursor, 4 fade out, 5 Snd_Play, 6 Snd_Stop; switch Sw_065532
; ---------------------------------------------------------------------------
Cerebro_RunTextScript:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	clr.b	-$38C6(a5)
	move.w	#$2,-$3B02(a5)
	jsr	$504A(a5)	; -> Spr_BeginFrame
	lea.l	g_SpriteTable(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
	jsr	$5052(a5)	; -> Spr_EndFrame
	move.b	#$1,g_DmaFlushReq(a5)
	movea.l	-$3B14(a5),a4
	bra.w	loc_06569A
loc_065596:
	move.b	(a4),d6
	addq.l	#$2,a4
	move.b	d6,d0
	subq.b	#$1,d0
	bcs.w	Cerebro_TextOpPrint
	cmpi.b	#$5,d0
	bhi.w	Cerebro_TextOpPrint
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_065532(pc,d1.w),d1
	jmp	Sw_065532-2(pc,d1.w)
