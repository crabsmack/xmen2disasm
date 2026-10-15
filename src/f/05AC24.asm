; ---------------------------------------------------------------------------
; BaniMazaB2_PlacePlayers - place the players at the BaniMazaB2 start with +$2E bit 2 set
; In:  none
; Out: none
; Evidence: Players_PlaceAtStart(0,0); +$2E |= 4 for each present player
; ---------------------------------------------------------------------------
BaniMazaB2_PlacePlayers:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05AC54
	ori.b	#$4,g_Player1+$2E(a5)
loc_05AC54:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05AC72
	ori.b	#$4,g_Player2+$2E(a5)
loc_05AC72:
	unlk	a6
	rts
