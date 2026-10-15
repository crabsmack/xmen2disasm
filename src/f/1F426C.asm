; ---------------------------------------------------------------------------
; Player_IsNcOrWolverine2 - is this player Nightcrawler or Wolverine (byte-identical copy of Player_IsNcOrWolverine)
; In:  8(a6) = player
; Out: d0 = byte 1/0
; Evidence: same body as Player_IsNcOrWolverine; only caller XPlayer_CanRejoinAt
; ---------------------------------------------------------------------------
Player_IsNcOrWolverine2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	(a0),a4
	moveq	#$1,d3
	lea.l	$2BA2(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F4292
	lea.l	$2BB2(a5),a0
	cmpa.l	$2(a0),a4
	beq.s	loc_1F4292
	moveq	#$0,d3
loc_1F4292:
	move.b	d3,d0
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
