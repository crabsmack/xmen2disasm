; ---------------------------------------------------------------------------
; XPlayer_InitSpawnRec - XPLAYER slot +$0A: register a player start record (parent InitSpawnRec, then remember it as P1's or P2's start)
; In:  8(a6) = spawn record, $C(a6) = placement entry
; Out: d0
; Evidence: ACTOR InitSpawnRec, rec+4 &= ~1 (never auto-spawns); placement +6 == 2 -> $FFE99C, else $FFE9A0
; ---------------------------------------------------------------------------
XPlayer_InitSpawnRec:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	lea.l	$2B8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	andi.b	#$FE,$4(a3)
	move.w	$6(a4),d0
	subq.w	#$1,d0
	addq.w	#$8,a7
	beq.s	loc_1F2200
	subq.w	#$1,d0
	bne.s	loc_1F2200
	move.l	a4,g_P2StartRec(a5)
	bra.s	loc_1F2204
loc_1F2200:
	move.l	a4,g_P1StartRec(a5)
loc_1F2204:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
