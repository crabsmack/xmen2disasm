; ---------------------------------------------------------------------------
; Scene_Register - append a named scene {name string, scene function} to g_SceneTable
; In:  8(a6) = C string: scene name   $C(a6) = scene function pointer
; Out: d0 = byte: index of the new entry
; Evidence: 8-byte entries at g_SceneTable, count byte g_SceneCount post-incremented; callers pass Str_* names (Cerebro screens, stages)
; ---------------------------------------------------------------------------
Scene_Register:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	g_SceneTable(a5),a4
	move.b	g_SceneCount(a5),d0
	addq.b	#$1,g_SceneCount(a5)
	move.b	d0,d7
	moveq	#$0,d0
	move.b	d7,d0
	asl.w	#$3,d0
	move.l	$8(a6),(a4,d0.w)
	moveq	#$0,d0
	move.b	d7,d0
	asl.w	#$3,d0
	move.l	$C(a6),$4(a4,d0.w)
	move.b	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
