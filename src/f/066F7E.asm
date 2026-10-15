; ---------------------------------------------------------------------------
; sub_066F7E	[jt 469]
; ---------------------------------------------------------------------------
sub_066F7E:
	link.w	a6,#$0
	move.w	#$1,-$3C5E(a5)
	move.w	#$1,-$3B0C(a5)
	clr.w	-$3B0A(a5)
	moveq	#$0,d0
	move.l	d0,-$3B14(a5)
	jsr	sub_066B26(pc)
	moveq	#$2,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_066FAA
	jsr	$32(a5)	; -> Game_ResetPlayers
	bra.s	loc_066FB6
loc_066FAA:
	move.w	#$FFFF,g_SceneIndex(a5)
	move.b	#$1,-$38C2(a5)
loc_066FB6:
	unlk	a6
	rts
