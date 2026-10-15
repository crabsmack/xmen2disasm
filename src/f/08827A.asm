; ---------------------------------------------------------------------------
; CloneA5_CamUpdate - CloneA5 camera update hook: push the players by the scroll step -$3B02, then run the camera's own +8 / +$10 / +$C functions
; In:  8(a6) = camera
; Out: none
; Evidence: installed at camera +4 by CloneA5_CamSetHooks; for each live player in view: x -= step << 8 and Obj_UpdateBoxes; TAS 49283-52125
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_CamUpdate:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	-$349C(a5),d7
	move.w	-$34A0(a5),d7
	tst.w	-$3B02(a5)
	beq.w	loc_088382
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0882B8
	move.w	#$1000,d0
	and.w	-$1754(a5),d0
	beq.s	loc_0882D4
loc_0882B8:
	lea.l	$2BBA(a5),a0
	move.l	g_Player1(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_08830C
	lea.l	$467A(a5),a0
	move.l	-$1714(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_08830C
loc_0882D4:
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	move.w	-$1706(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_08830C
	move.w	-$3B02(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	d0,-$16E6(a5)
	move.w	-$3B02(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	d0,-$1750(a5)
	pea.l	g_Player1(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_08830C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_08832E
	move.w	#$1000,d0
	and.w	-$1844(a5),d0
	beq.s	loc_08834A
loc_08832E:
	lea.l	$2BBA(a5),a0
	move.l	g_Player2(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_088382
	lea.l	$467A(a5),a0
	move.l	-$1804(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_088382
loc_08834A:
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	move.w	-$17F6(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_088382
	move.w	-$3B02(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	d0,-$17D6(a5)
	move.w	-$3B02(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	sub.l	d0,-$1840(a5)
	pea.l	g_Player2(a5)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_088382:
	move.l	a4,-(a7)
	movea.l	$8(a4),a0
	jsr	(a0)
	movea.l	$10(a4),a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_08839A
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_08839A:
	move.l	a4,-(a7)
	movea.l	$C(a4),a0
	jsr	(a0)
	addq.w	#$4,a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
