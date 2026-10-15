; ---------------------------------------------------------------------------
; Switch_TileHit - switch tile handler: if no search is running, start a timer that looks for the SWITCH placement at this tile
; In:  $A(a6) = word tile x  $E(a6) = word tile y
; Out: d0 = 0
; Evidence: search state at $FFC632 (from Switch_ClassInit), busy byte $FFC636; scans g_PlacementList .. + g_SpawnRecCount*16; Timer_Create(Switch_FindAndToggle)
; ---------------------------------------------------------------------------
Switch_TileHit:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	g_SwitchSearchRec(a5),a4
	tst.b	g_SwitchSearchBusy(a5)
	beq.s	loc_1079EE
	moveq	#$0,d0
	bra.s	loc_107A34
loc_1079EE:
	move.b	#$1,g_SwitchSearchBusy(a5)
	move.w	$A(a6),$8(a4)
	move.w	$E(a6),$A(a4)
	move.l	g_PlacementList(a5),(a4)
	move.w	g_SpawnRecCount(a5),d0
	ext.l	d0
	movea.l	g_PlacementList(a5),a0
	asl.l	#$4,d0
	adda.l	d0,a0
	move.l	a0,$4(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	pea.l	Switch_FindAndToggle(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a3
	move.l	a3,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	moveq	#$0,d0
	lea.l	$14(a7),a7
loc_107A34:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
