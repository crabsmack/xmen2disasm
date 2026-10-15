; ---------------------------------------------------------------------------
; SavageJungle_PlacePlayers - Savage jungle: place the players and clear their sprite bit 2
; In:  none
; Out: none
; Evidence: Players_PlaceAtStart($4000, $4000, $4010, $4010); live players +$2E &= ~4 and DrawList_SetPriority re-sort
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageJungle_PlacePlayers:
	link.w	a6,#$0
	pea.l	($4010).w
	pea.l	($4010).w
	pea.l	($4000).w
	pea.l	($4000).w
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_0C0F42
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
loc_0C0F42:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0C0F84
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
loc_0C0F84:
	unlk	a6
	rts
