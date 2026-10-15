; ---------------------------------------------------------------------------
; PerimeterDoor_TileHook - SavageA2 tile hook [3]: forward a tile hit to the scene's PERIMETERDOOR (slot +$6E)
; In:  8(a6) = column, $A(a6) = row, $C(a6) = object, ...
; Out: d0 = 0
; Evidence: g_PerimeterDoorObj = the door (PerimeterDoor_Init); installed in $FFC714 by SavageA2_InstallTileHooks; 2 callers
; Found: jt 889
; ---------------------------------------------------------------------------
PerimeterDoor_TileHook:
	link.w	a6,#$0
	tst.l	g_PerimeterDoorObj(a5)
	beq.s	loc_0AD1B6
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$10(a6),-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	g_PerimeterDoorObj(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_0AD1B6:
	moveq	#$0,d0
	unlk	a6
	rts
