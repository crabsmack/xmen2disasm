; ---------------------------------------------------------------------------
; XClone_LockArena - lock the arena around a clone: players flagged, camera clamped to the arena (XClone_CamSetArenaMode), clone theme by type
; In:  8(a6) = clone
; Out: none
; Evidence: +6 |= $1000; players +$90 |= $200000; -$3B30 := clone if none; camera limits -$3B0A..-$3B10 from the arena and the current limits; g_Camera +$1C := XClone_CamSetArenaMode; sub_1FE5F2; switch on Clone_CharTypeOf -> sub_1FE630($12, n); sound $74; -$3B08 |= 1 (arena locked, XClone_SegHookArenaLocked); clone +$B0 = 1; caller XClone_StateWaitPlayers; TAS 53059-57262
; ---------------------------------------------------------------------------
XClone_LockArena:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$1000,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0990AC
	ori.l	#$200000,-$16C8(a5)
loc_0990AC:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0990CC
	ori.l	#$200000,-$17B8(a5)
loc_0990CC:
	tst.l	-$3B30(a5)
	bne.s	loc_0990D6
	move.l	a4,-$3B30(a5)
loc_0990D6:
	move.w	-$3A90(a5),d0
	cmp.w	-$3B2C(a5),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0990EA
	move.w	-$3A90(a5),d0
	bra.s	loc_0990EE
loc_0990EA:
	move.w	-$3B2C(a5),d0
loc_0990EE:
	move.w	d0,d4
	move.w	$A4(a4),d0
	ext.l	d0
	moveq	#$20,d1
	sub.l	d1,d0
	move.w	-$3A94(a5),d2
	ext.l	d2
	cmp.l	d2,d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_099110
	move.w	-$3A94(a5),d0
	ext.l	d0
	bra.s	loc_099118
loc_099110:
	move.w	$A4(a4),d0
	sub.w	#$20,d0
loc_099118:
	move.w	d0,d5
	move.w	-$3B2A(a5),d0
	ext.l	d0
	sub.l	#$140,d0
	move.w	-$3A8E(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_09913C
	move.w	-$3A8E(a5),d0
	ext.l	d0
	bra.s	loc_099144
loc_09913C:
	move.w	-$3B2A(a5),d0
	sub.w	#$140,d0
loc_099144:
	move.w	d0,d6
	move.w	$A6(a4),d0
	ext.l	d0
	add.l	#$FFFFFF40,d0
	move.w	-$3A92(a5),d1
	ext.l	d1
	cmp.l	d1,d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_099168
	move.w	-$3A92(a5),d0
	ext.l	d0
	bra.s	loc_099170
loc_099168:
	move.w	$A6(a4),d0
	add.w	#$FF40,d0
loc_099170:
	move.w	d0,d7
	move.w	d4,-$3B0A(a5)
	move.w	d5,-$3B0C(a5)
	move.w	d6,-$3B0E(a5)
	move.w	d7,-$3B10(a5)
	lea.l	XClone_CamSetArenaMode(pc),a0
	movea.l	g_Camera(a5),a1
	move.l	a0,$1C(a1)
	move.b	#$1,-$3892(a5)
	jsr	$5242(a5)	; -> Snd_StopAll
	move.l	a4,-(a7)
	jsr	Clone_CharTypeOf(pc)
	subq.w	#$1,d0
	addq.w	#$4,a7
	bmi.s	XClone_LockArena_SetTheme
	cmpi.w	#$6,d0
	bgt.s	XClone_LockArena_SetTheme
	add.w	d0,d0
	move.w	Sw_09907A(pc,d0.w),d0
	jmp	Sw_09907A-2(pc,d0.w)
