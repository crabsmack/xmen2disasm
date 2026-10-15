; ---------------------------------------------------------------------------
; Switch_InitSpawnRec - fill the spawn record like ACTOR, then clear its state byte +4 so the level spawn pass never creates a Switch from it (static, class slot 1, +$0A)
; In:  8(a6) = spawn record (14 bytes)  $C(a6) = level placement entry
; Out: none
; Evidence: parent InitSpawnRec then clr.b 4(rec); Level_FrameLoop only spawns records with bit 0 set; method 1 of class descriptor $107A3E (name string "SWITCH", parent ACTOR)
; ---------------------------------------------------------------------------
Switch_InitSpawnRec:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	a4,a3
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2A4A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	clr.b	$4(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
