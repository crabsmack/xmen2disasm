; ---------------------------------------------------------------------------
; AvalonA2_PlacePlayers - place the players at the AvalonA2 start and set two scene values to $300
; In:  none
; Out: none
; Evidence: Players_PlaceAtStart(0,0); -$3CD0 = -$3AFA = $300
; ---------------------------------------------------------------------------
AvalonA2_PlacePlayers:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	#$300,g_RetractFloorDepth(a5)
	move.w	g_RetractFloorDepth(a5),-$3AFA(a5)
	unlk	a6
	rts
