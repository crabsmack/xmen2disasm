; ---------------------------------------------------------------------------
; Debris_SetSprDef - set the sprite-definition slot a debris pool draws with
; In:  8(a6) = pool  $E(a6) = word slot
; Out: none
; Evidence: pool +4 := slot (-1 = pool not drawn/updated); caller CloneA5_LoadResources (jt 1894)
; ---------------------------------------------------------------------------
Debris_SetSprDef:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	$E(a6),$4(a0)
	unlk	a6
	rts
