; ---------------------------------------------------------------------------
; Deathbird_StateChooseAttack - Deathbird: pick the next attack from its pattern list (swoop, low dive or fly-by); if the elevator is moving, sometimes go for the switch
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: pattern pointer $FFC6EC (Tbl_DeathbirdAttackOrder (jt $2B0A), $FF ends); Deathbird_SetMoveMode 5/7/4/9
; ---------------------------------------------------------------------------
Deathbird_StateChooseAttack:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.w	loc_112B12
	movea.l	g_Elevator(a5),a0
	tst.b	$10(a0)
	beq.s	loc_112A7A
	moveq	#$20,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_112A7A
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateGoToSwitch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_112B24
loc_112A7A:
	movea.l	g_SceneVar3B14(a5),a0
	moveq	#-$1,d0
	cmp.b	(a0),d0
	bne.s	loc_112A8E
	lea.l	$2B0A(a5),a0
	move.l	$2(a0),g_SceneVar3B14(a5)
loc_112A8E:
	movea.l	g_SceneVar3B14(a5),a0
	move.b	(a0),d7
	move.l	a0,d0
	addq.l	#$1,g_SceneVar3B14(a5)
	move.b	d7,d0
	subq.b	#$1,d0
	beq.s	loc_112AA6
	subq.b	#$1,d0
	beq.s	loc_112ACA
	bra.s	loc_112AEE
loc_112AA6:
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateSwoopDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112B24
loc_112ACA:
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateDiveLow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112B24
loc_112AEE:
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateFlyOff(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112B24
loc_112B12:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateChooseAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112B24:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
