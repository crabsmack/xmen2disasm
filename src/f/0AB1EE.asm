; ---------------------------------------------------------------------------
; BubbleManager_SpawnAtSurface - BUBBLEMANAGER: release one bubble on the surface line (-$38BC) near the left of the view (direction 7) and restart the timer
; In:  8(a6) = this
; Out: none
; Evidence: FloatBubble_Spawn((g_CameraX + $20 + (counter & $FF)) << 8, -$38BC << 8, +$98, +$9A, 7); +$6E = +$9C
; Found: link-after-rts
; ---------------------------------------------------------------------------
BubbleManager_SpawnAtSurface:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$7,d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	moveq	#$20,d1
	add.l	d1,d0
	move.l	#$FF,d2
	and.l	g_FrameCounter(a5),d2
	add.l	d0,d2
	move.l	d2,d6
	lsl.l	#$8,d6
	move.w	-$38BC(a5),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	ext.l	d5
	move.l	d5,-(a7)
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$98(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$1B22(a5)	; -> FloatBubble_Spawn
	movea.l	d0,a3
	move.w	$9C(a4),$6E(a4)
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
