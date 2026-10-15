; ---------------------------------------------------------------------------
; Credits_RunScene - scene 'CerebroScreen Credits': credits text (jt $FC2), then a new game
; In:  none
; Out: none
; Evidence: Scene_RegisterAll entry; music 10 unless -$3C5E bit $4000; Cerebro_Run; Game_ResetPlayers; clears -$3C5E
; ---------------------------------------------------------------------------
Credits_RunScene:
	link.w	a6,#$0
	clr.w	-$3B0C(a5)
	clr.w	-$3B0A(a5)
	lea.l	$FC2(a5),a0
	move.l	$2(a0),-$3B14(a5)
	move.w	#$4000,d0
	and.w	-$3C5E(a5),d0
	bne.s	loc_067010
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_067010:
	jsr	Cerebro_Run(pc)
	jsr	$32(a5)	; -> Game_ResetPlayers
	clr.w	-$3C5E(a5)
	unlk	a6
	rts
