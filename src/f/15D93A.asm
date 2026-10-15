; ---------------------------------------------------------------------------
; Actor_InitSpawnRec - ACTOR slot +$0A: fill a spawn record from a level placement entry
; In:  8(a6) = spawn record   $C(a6) = placement entry
; Out: none
; Evidence: rec+4 = 1 (state), +5 = $FF (no object), +6/+8 = entry words +2/+4 (x, y), +$A = entry pointer
; ---------------------------------------------------------------------------
Actor_InitSpawnRec:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.b	#$1,$4(a4)
	move.b	#$FF,$5(a4)
	move.w	$2(a3),$6(a4)
	move.w	$4(a3),$8(a4)
	move.l	a3,$A(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
