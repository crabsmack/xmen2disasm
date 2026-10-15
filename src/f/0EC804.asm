; ---------------------------------------------------------------------------
; CoreElevator_InitSpawnRec - fill the spawn record like ACTOR, then set record +4 bit 3 so the level spawn pass creates the lift at once, whatever the camera position (static, class slot 1, +$0A)
; In:  8(a6) = spawn record (14 bytes)  $C(a6) = level placement entry
; Out: none
; Evidence: parent InitSpawnRec then ori.b #8,4(rec); Level_FrameLoop skips the +$2A in-view test for bit 3; method 1 of class descriptor $0EC98E (name string "COREELEVATOR", parent ACTOR)
; ---------------------------------------------------------------------------
CoreElevator_InitSpawnRec:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2902(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	ori.b	#$8,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
