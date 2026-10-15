; ---------------------------------------------------------------------------
; SavageA2_PlacePlayers - SavageA2: place the players (Players_PlaceAtStart(0,0,0,0))
; In:  none
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_PlacePlayers:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	unlk	a6
	rts
