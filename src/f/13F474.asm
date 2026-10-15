; ---------------------------------------------------------------------------
; Debris_SetFloorY - set the floor line a debris pool's pieces bounce on
; In:  8(a6) = pool  $E(a6) = word floor y px
; Out: none
; Evidence: pool +2 := y (Debris_CreatePool default 400); callers BroodBoss_Init, XClone_TakeDamage, XClone_TileHookOpenWall (jt 1893)
; ---------------------------------------------------------------------------
Debris_SetFloorY:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	$E(a6),$2(a0)
	unlk	a6
	rts
