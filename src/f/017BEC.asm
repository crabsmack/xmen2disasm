; ---------------------------------------------------------------------------
; FarAcolyte_StateWaitPlayer - FARACOLYTE: wait until the nearest player's x is inside +$8C..+$8E, then start the orb and chase for up to 120 frames
; In:  8(a6) = this
; Out: d0
; Evidence: slot $6E FarAcolyte_StartOrb; +$6E = $78; next FarAcolyte_StateOrbChase
; ---------------------------------------------------------------------------
FarAcolyte_StateWaitPlayer:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_017C56
	move.l	$8(a3),d7
	asr.l	#$8,d7
	cmp.w	$8C(a4),d7
	blt.s	loc_017C1E
	cmp.w	$8E(a4),d7
	ble.s	loc_017C32
loc_017C1E:
	clr.w	$6C(a4)
	lea.l	FarAcolyte_StateWaitPlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_017C56
loc_017C32:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.w	#$78,$6E(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	FarAcolyte_StateOrbChase(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_017C56:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
