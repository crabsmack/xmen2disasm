; ---------------------------------------------------------------------------
; XClone_FrameHookCollapse - scene hook after the last clone: random falling debris and explosions around the camera with screen shakes
; In:  none
; Out: none
; Evidence: installed by XClone_EndWave; random timers g_SceneVar3B38/g_SceneVar3B36 (Rand_Next); plain ACTOR + ExplodeFx_ChainRepeat(jt[$1C1A]) near the top of the view, g_CamShake := jt[$1C2A]; Debris_Spawn(..., 10) explosions
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_FrameHookCollapse:
	link.w	a6,#$FFF0
	movem.l	d5-d7/a4,-(a7)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_099230
	moveq	#$2,d0
	bra.s	loc_099232
loc_099230:
	moveq	#$1,d0
loc_099232:
	move.w	d0,d7
	ext.l	d7
	add.l	d7,g_FrameCounter(a5)
	tst.w	g_SceneVar3B06(a5)
	ble.s	loc_099244
	sub.w	d7,g_SceneVar3B06(a5)
loc_099244:
	tst.w	g_SceneVar3B06(a5)
	bge.s	loc_09924E
	clr.w	g_SceneVar3B06(a5)
loc_09924E:
	tst.w	g_SceneVar3B36(a5)
	ble.s	loc_099258
	sub.w	d7,g_SceneVar3B36(a5)
loc_099258:
	tst.w	g_SceneVar3B38(a5)
	ble.s	loc_099262
	sub.w	d7,g_SceneVar3B38(a5)
loc_099262:
	tst.w	g_SceneVar3B38(a5)
	bgt.w	loc_09936E
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	add.w	#$1E,d0
	move.l	d0,-$4(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	move.l	-$4(a6),d1
	add.w	d1,d0
	move.l	d0,-$8(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$F,d0
	and.w	d1,d0
	move.l	-$8(a6),d1
	add.w	d1,d0
	move.w	d0,g_SceneVar3B38(a5)
	move.w	g_CameraX(a5),d6
	add.w	#$A0,d6
	move.w	g_CameraY(a5),d5
	add.w	#$C0,d5
	cmpi.w	#$61E,d6
	bge.s	loc_0992E2
	move.w	g_CameraX(a5),d0
	add.w	#$20,d0
	move.l	d0,-$C(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3F,d0
	and.w	d1,d0
	move.l	-$C(a6),d1
	move.w	d0,d7
	add.w	d1,d7
	bra.s	loc_09930C
loc_0992E2:
	cmpi.w	#$1,d6
	ble.s	loc_09930C
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$120,d0
	move.l	d0,-$10(a6)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3F,d0
	and.w	d1,d0
	move.l	-$10(a6),d1
	move.w	d1,d7
	sub.w	d0,d7
loc_09930C:
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_099364
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$20,d1
	move.l	d1,-(a7)
	moveq	#-$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1A1A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	lea.l	$18(a7),a7
loc_099364:
	lea.l	$1A2A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
loc_09936E:
	tst.w	g_SceneVar3B36(a5)
	bgt.s	loc_0993B6
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1F,d0
	and.w	d1,d0
	add.w	#$3C,d0
	move.w	d0,g_SceneVar3B36(a5)
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$7F,d0
	and.w	d1,d0
	move.w	d0,d6
	add.w	g_CameraX(a5),d6
	move.w	g_CameraY(a5),d7
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	g_SceneVar3B1C(a5),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3B6A(a5)	; -> Debris_Spawn
	lea.l	$10(a7),a7
loc_0993B6:
	movem.l	-$20(a6),d5-d7/a4
	unlk	a6
	rts
