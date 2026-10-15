; ---------------------------------------------------------------------------
; FireWall_StateWaitOnScreen - FIREWALL: wait until on screen, then spawn the flame
; In:  8(a6) = this
; Out: d0
; Evidence: g_CameraX window
; ---------------------------------------------------------------------------
FireWall_StateWaitOnScreen:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d7
	asr.l	#$8,d7
	cmp.w	g_CameraX(a5),d7
	blt.s	loc_13410E
	ext.l	d7
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	cmp.l	d7,d0
	ble.s	loc_13410E
	clr.w	$6C(a4)
	lea.l	FireWall_StateSpawnFlame(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_134120
loc_13410E:
	clr.w	$6C(a4)
	lea.l	FireWall_StateWaitOnScreen(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_134120:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
