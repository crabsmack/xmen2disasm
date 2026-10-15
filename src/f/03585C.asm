; ---------------------------------------------------------------------------
; AvalonA4_PlacePlayers - place the players at the AvalonA4 start
; In:  none
; Out: none
; Evidence: Players_PlaceAtStart(0,0)
; ---------------------------------------------------------------------------
AvalonA4_PlacePlayers:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	unlk	a6
	rts
