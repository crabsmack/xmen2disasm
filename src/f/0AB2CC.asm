; ---------------------------------------------------------------------------
; BubbleManager_StateEdge - BUBBLEMANAGER state: when the timer is out and the surface line is on screen, release a surface bubble
; In:  8(a6) = this
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_StateEdge:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0AB304
	move.w	-$38BC(a5),d0
	cmp.w	g_CameraY(a5),d0
	ble.s	loc_0AB304
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	move.w	-$38BC(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_0AB304
	move.l	a4,-(a7)
	jsr	BubbleManager_SpawnAtSurface(pc)
	addq.w	#$4,a7
loc_0AB304:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
