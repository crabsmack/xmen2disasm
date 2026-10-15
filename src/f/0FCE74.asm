; ---------------------------------------------------------------------------
; SiberiaB1_DebrisAlloc - SiberiaB1: take the next debris slot (max 48)
; In:  none
; Out: d0 = slot or 0
; Evidence: count $FFC6F0
; ---------------------------------------------------------------------------
SiberiaB1_DebrisAlloc:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	moveq	#$30,d1
	cmp.w	g_SceneVar3B10(a5),d1
	ble.s	loc_0FCEA0
	move.w	g_SceneVar3B10(a5),d0
	addq.w	#$1,g_SceneVar3B10(a5)
	ext.l	d0
	movea.l	g_SceneVar3B24(a5),a0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
loc_0FCEA0:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
