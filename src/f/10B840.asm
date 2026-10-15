; ---------------------------------------------------------------------------
; SpaceA1_CamUpdate - SpaceA1 camera update: scroll with the elevator, stop the lift at the ends of the shaft (sound $35, end-of-stage timer 30)
; In:  8(a6) = camera
; Out: none
; Evidence: reads g_Elevator ($FFC63C) +4/+8/+$10/+$11; Scene_EndAfter(30); TAS every frame 37298-45095
; ---------------------------------------------------------------------------
SpaceA1_CamUpdate:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	$8(a4),a0
	jsr	(a0)
	movea.l	$10(a4),a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_10B864
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_10B864:
	movea.l	$14(a4),a3
	move.l	a3,d0
	beq.s	loc_10B872
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_10B872:
	movea.l	g_Elevator(a5),a0
	tst.b	$11(a0)
	bne.w	loc_10B938
	move.w	$8(a0),d0
	asr.w	#$8,d0
	sub.w	d0,g_BgScrollY(a5)
	movea.l	g_Elevator(a5),a0
	tst.b	$10(a0)
	beq.s	loc_10B8C4
	cmpi.l	#$20000,$4(a0)
	ble.w	loc_10B938
	movea.l	g_Elevator(a5),a0
	move.b	#$1,$11(a0)
	movea.l	g_Elevator(a5),a0
	clr.w	$8(a0)
	movea.l	g_Elevator(a5),a0
	clr.w	$A(a0)
	moveq	#$1E,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$4,a7
	bra.s	loc_10B938
loc_10B8C4:
	movea.l	g_Elevator(a5),a0
	tst.l	$4(a0)
	bge.s	loc_10B938
	move.b	#$1,$11(a0)
	movea.l	g_Elevator(a5),a0
	clr.w	$8(a0)
	movea.l	g_Elevator(a5),a0
	clr.w	$A(a0)
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.s	loc_10B912
	clr.w	g_Player1+$68(a5)
loc_10B912:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_10B92E
	clr.w	g_Player2+$68(a5)
loc_10B92E:
	moveq	#$1E,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$4,a7
loc_10B938:
	move.l	a4,-(a7)
	movea.l	$C(a4),a0
	jsr	(a0)
	moveq	#$1,d3
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$4,a7
	beq.s	loc_10B97C
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_10B97C
	tst.b	g_BgLockToObj(a5)
	bne.s	loc_10B97C
	moveq	#$0,d3
loc_10B97C:
	move.b	d3,g_CamActive(a5)
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
