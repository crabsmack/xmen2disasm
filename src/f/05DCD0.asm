; ---------------------------------------------------------------------------
; Tuskette_StateExitFall2 - TUSKETTE: fall until 250 px below the camera top
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateRemove
; ---------------------------------------------------------------------------
Tuskette_StateExitFall2:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	g_CameraY(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$C(a4),d7
	sub.l	d0,d7
	cmpi.l	#$FA00,d7
	ble.s	loc_05DD04
	clr.w	$6C(a4)
	lea.l	Tuskette_StateRemove(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05DD04:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
