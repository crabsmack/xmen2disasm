; ---------------------------------------------------------------------------
; Beast_SetFrameKeepCenterX - change frame keeping the box's horizontal centre in place
; In:  8(a6) = player, $C(a6) = word frame
; Out: none
; Evidence: like Beast_SetFrameKeepCenter for x only
; ---------------------------------------------------------------------------
Beast_SetFrameKeepCenterX:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d6
	lsl.l	#$7,d6
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	lsl.l	#$7,d7
	move.l	d7,d0
	sub.l	d6,d0
	sub.l	d0,$8(a4)
	move.b	#$1,g_CamModeSwitched(a5)
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
