; ---------------------------------------------------------------------------
; Cerebro_FrameHook - per-frame hook of Cerebro screens: frame counter, a button ends a text wait, palette animation
; In:  none
; Out: none
; Evidence: installed in -$388E by Cerebro_Run; g_FrameCounter += 1/2; Pad_Update; -$3902 == 2 and pad bits $F0 -> 0; Cerebro_AnimatePalettes
; ---------------------------------------------------------------------------
Cerebro_FrameHook:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_064EB6
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
loc_064EB6:
	jsr	$50FA(a5)	; -> Pad_Update
	moveq	#$2,d0
	cmp.w	-$3B02(a5),d0
	bne.s	loc_064ED6
	move.w	g_Pad2Pressed(a5),d0
	or.w	g_Pad1Pressed(a5),d0
	move.w	#$F0,d1
	and.w	d0,d1
	beq.s	loc_064ED6
	clr.w	-$3B02(a5)
loc_064ED6:
	jsr	Cerebro_AnimatePalettes(pc)
	unlk	a6
	rts
