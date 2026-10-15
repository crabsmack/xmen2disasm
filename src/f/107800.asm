; ---------------------------------------------------------------------------
; Switch_InitSpawnRec - Switch: fill a 14-byte spawn record from level placement data (static, class slot 1, +$0A; called by the level spawn-list builder)
; In:  8(a6) = spawn record (14 bytes)  $C(a6) = level placement entry
; Out: none
; Evidence: method 1 of class descriptor $107A3E (name string "SWITCH", parent ACTOR)
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
