; ---------------------------------------------------------------------------
; XPlayer_StateFallOffScreen - falling-off-screen state: when the player is more than 224 px below the camera, stop it, hide it and wait 30 frames to rejoin
; In:  8(a6) = player
; Out: d0
; Evidence: box top +$4C - g_CameraY > $E0 -> velocities/gravity 0, SetFrame($FF), camera +$4A &= ~2, delay 30, state XPlayer_StateRejoin; +$6A held at 60
; ---------------------------------------------------------------------------
XPlayer_StateFallOffScreen:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$3C,$6A(a4)
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	cmpi.l	#$E0,d0
	ble.s	loc_1F0990
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movea.l	g_Camera(a5),a0
	andi.w	#$FFFD,$4A(a0)
	addq.w	#$8,a7
	move.w	#$1E,$6C(a4)
	lea.l	XPlayer_StateRejoin(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F0990:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
