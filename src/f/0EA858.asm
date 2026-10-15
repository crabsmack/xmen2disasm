; ---------------------------------------------------------------------------
; Hologram_InitSpawnRec - fill the spawn record like ACTOR, then set record +4 bit 3 so the level spawn pass creates the Hologram at once, whatever the camera position (static, class slot 1, +$0A)
; In:  8(a6) = spawn record (14 bytes)  $C(a6) = level placement entry
; Out: none
; Evidence: parent InitSpawnRec then ori.b #8,4(rec); Level_FrameLoop spawns a waiting record (bit 0) without the +$2A in-view test when bit 3 is set; method 1 of class descriptor $0EAE16 (name string "HOLOGRAM", parent ACTOR)
; ---------------------------------------------------------------------------
Hologram_InitSpawnRec:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$27F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	ori.b	#$8,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
