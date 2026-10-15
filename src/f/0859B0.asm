; ---------------------------------------------------------------------------
; BroodBossParts_Draw - vtable +$1A: draw a boss part when within -$40..$180 px of the camera
; Evidence: same as ACTOR Draw ($15E55A) with a wider horizontal window; TAS 49290-51132
; ---------------------------------------------------------------------------
BroodBossParts_Draw:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.w	#$FFC0,d7
	ble.w	loc_085A9C
	cmpi.w	#$180,d7
	bge.w	loc_085A9C
	moveq	#$40,d0
	and.w	$6(a4),d0
	beq.s	loc_0859F4
	moveq	#$1,d0
	and.w	g_LevelFrame(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.w	loc_085A9C
loc_0859F4:
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_085A14
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_085A14
	moveq	#$1,d3
loc_085A14:
	tst.b	d3
	beq.s	loc_085A30
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_085A40
loc_085A30:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_085A40:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_085A62
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_085A62
	moveq	#$1,d3
loc_085A62:
	tst.b	d3
	beq.s	loc_085A7E
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_085A8E
loc_085A7E:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_085A8E:
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
loc_085A9C:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
