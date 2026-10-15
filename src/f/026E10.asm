; ---------------------------------------------------------------------------
; RetractFloor_StateDrop - RETRACTFLOOR: remove its floor segment so the players fall, set the camera fields to $5A/$5F, sound $DD
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_Detach on present players; g_FloatFallSpeed = g_RetractFloorDepth; Seg_Free(+$90); next RetractFloor_StateSlide
; ---------------------------------------------------------------------------
RetractFloor_StateDrop:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$90(a4),-$4(a6)
	beq.s	loc_026E90
	lea.l	g_Player1(a5),a3
	move.l	a3,d0
	beq.s	loc_026E52
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_026E52
	move.l	a3,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	g_RetractFloorDepth(a5),g_FloatFallSpeed(a5)
	addq.w	#$4,a7
loc_026E52:
	lea.l	g_Player2(a5),a3
	move.l	a3,d0
	beq.s	loc_026E80
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_026E80
	move.l	a3,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	g_RetractFloorDepth(a5),g_FloatFallSpeed(a5)
	addq.w	#$4,a7
loc_026E80:
	move.l	-$4(a6),-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	moveq	#$0,d0
	move.l	d0,$90(a4)
	addq.w	#$4,a7
loc_026E90:
	tst.l	g_Camera(a5)
	beq.s	loc_026EAA
	movea.l	g_Camera(a5),a0
	move.w	#$5A,$40(a0)
	movea.l	g_Camera(a5),a0
	move.w	#$5F,$42(a0)
loc_026EAA:
	pea.l	($DD).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($DD).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	RetractFloor_StateSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
