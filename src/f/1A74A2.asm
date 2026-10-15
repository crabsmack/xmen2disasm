; ---------------------------------------------------------------------------
; Nightcrawler_SetTeleportVelocity - set the teleport velocity from the stored direction bits (diagonals slower) and match the camera pan
; In:  8(a6) = player
; Out: d0
; Evidence: +$C2 bits U/D/L/R; speed $A00 straight, $700 diagonal; vx/vy and max +$22; when not Cam_IsPanning: camera +$54 = vx, +$4C = +/-camera +$58
; ---------------------------------------------------------------------------
Nightcrawler_SetTeleportVelocity:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d3
	moveq	#$C,d0
	and.w	$C2(a4),d0
	beq.s	loc_1A74C2
	moveq	#$3,d0
	and.w	$C2(a4),d0
	beq.s	loc_1A74C2
	moveq	#$1,d3
loc_1A74C2:
	move.b	d3,d5
	beq.s	loc_1A74CC
	move.w	#$700,d0
	bra.s	loc_1A74D0
loc_1A74CC:
	move.w	#$A00,d0
loc_1A74D0:
	ext.l	d0
	move.l	d0,d7
	tst.b	d5
	beq.s	loc_1A74DE
	move.w	#$700,d0
	bra.s	loc_1A74E2
loc_1A74DE:
	move.w	#$A00,d0
loc_1A74E2:
	ext.l	d0
	move.l	d0,d6
	move.w	d7,$22(a4)
	moveq	#$4,d0
	and.w	$C2(a4),d0
	beq.s	loc_1A7524
	move.l	d7,d0
	neg.l	d0
	move.w	d0,$16(a4)
	move.l	g_Camera(a5),-(a7)
	jsr	$420A(a5)	; -> Cam_IsPanning
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_1A7554
	movea.l	g_Camera(a5),a0
	move.w	$16(a4),$54(a0)
	movea.l	g_Camera(a5),a0
	move.w	$58(a0),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$4C(a0)
	bra.s	loc_1A7554
loc_1A7524:
	moveq	#$8,d0
	and.w	$C2(a4),d0
	beq.s	loc_1A7554
	move.w	d7,$16(a4)
	move.l	g_Camera(a5),-(a7)
	jsr	$420A(a5)	; -> Cam_IsPanning
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_1A7554
	movea.l	g_Camera(a5),a0
	move.w	$16(a4),$54(a0)
	movea.l	g_Camera(a5),a0
	movea.l	a0,a1
	move.w	$58(a0),$4C(a1)
loc_1A7554:
	move.w	$C2(a4),d0
	btst	#$0,d0
	beq.s	loc_1A7568
	move.l	d6,d0
	neg.l	d0
	move.w	d0,$18(a4)
	bra.s	loc_1A7574
loc_1A7568:
	moveq	#$2,d0
	and.w	$C2(a4),d0
	beq.s	loc_1A7574
	move.w	d6,$18(a4)
loc_1A7574:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
