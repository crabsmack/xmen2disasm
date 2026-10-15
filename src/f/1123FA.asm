; ---------------------------------------------------------------------------
; Deathbird_Draw - Deathbird: position/draw the object's sprite relative to the camera (class slot 5, +$1A)
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Draw:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$40,d0
	and.w	$6(a4),d0
	beq.s	loc_11241E
	moveq	#$1,d0
	and.w	g_LevelFrame(a5),d0
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	beq.w	loc_11258C
loc_11241E:
	tst.b	$B4(a4)
	beq.w	loc_1124E4
	movea.l	$B0(a4),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1124E4
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_112458
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_112458
	moveq	#$1,d3
loc_112458:
	tst.b	d3
	beq.s	loc_112474
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_112484
loc_112474:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_112484:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_1124A6
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_1124A6
	moveq	#$1,d3
loc_1124A6:
	tst.b	d3
	beq.s	loc_1124C2
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_1124D2
loc_1124C2:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_1124D2:
	move.l	d1,-(a7)
	move.l	$B0(a4),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
	bra.w	loc_11258C
loc_1124E4:
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_112504
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_112504
	moveq	#$1,d3
loc_112504:
	tst.b	d3
	beq.s	loc_112520
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_112530
loc_112520:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_112530:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_112552
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_112552
	moveq	#$1,d3
loc_112552:
	tst.b	d3
	beq.s	loc_11256E
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_11257E
loc_11256E:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_11257E:
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
loc_11258C:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
