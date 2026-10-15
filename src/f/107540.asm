; ---------------------------------------------------------------------------
; SpaceB1_Seg28Handler - SpaceB1 handler for floor-segment type 28: true when Player_ClimbState(actor) is
; In:  8(a6) = mode  $C(a6) = segment  $10(a6) = actor
; Out: d0 = 0/1
; Evidence: installed in $FFCE06 ($FFCD96 + 28*4) by SpaceB1_LoadLevel
; ---------------------------------------------------------------------------
SpaceB1_Seg28Handler:
	link.w	a6,#$0
	move.l	d0,-(a7)
	move.l	$10(a6),-(a7)
	jsr	$4D72(a5)	; -> Player_ClimbState
	addq.l	#$4,a7
	move.l	d0,d1
	move.l	(a7)+,d0
	tst.b	d1
	sne.b	d0
	andi.w	#$1,d0
	unlk	a6
	rts
