; ---------------------------------------------------------------------------
; BaniMazaA1_PlacePlayers - place the players at the BaniMazaA1 start and move them to draw layer 0 (clear +$2E bit 2)
; In:  none
; Out: none
; Evidence: Players_PlaceAtStart; per present player: +$2E &= ~4, DrawList_SetPriority(+$88 node, 0, ...); BaniMazaA2_PlacePlayers does the opposite
; ---------------------------------------------------------------------------
BaniMazaA1_PlacePlayers:
	link.w	a6,#$0
	move.l	#$38410,-(a7)
	move.l	#$38410,-(a7)
	pea.l	($7000).w
	move.l	#$38400,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_038B66
	andi.b	#$FB,g_Player1+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player1+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player1+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_Player1+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	lea.l	$10(a7),a7
loc_038B66:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_038BA8
	andi.b	#$FB,g_Player2+$2E(a5)
	moveq	#$8,d0
	and.w	g_Player2+$6(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	g_Player2+$42(a5),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	g_Player2+$88(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
loc_038BA8:
	unlk	a6
	rts
