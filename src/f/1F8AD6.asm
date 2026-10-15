; ---------------------------------------------------------------------------
; Seg_CollideObj_RetHit - Seg_CollideObj exits: return 2 (contact), or 3 at +$C
; In:  none
; Out: d0 = 2 / 3
; Evidence: shared exits of the collide cases
; ---------------------------------------------------------------------------
Seg_CollideObj_RetHit:
	moveq	#$2,d0
	movem.l	-$20(a6),d3-d7/a2-a4
	unlk	a6
	rts
loc_1F8AE2:
	moveq	#$3,d0
	movem.l	-$20(a6),d3-d7/a2-a4
	unlk	a6
	rts
