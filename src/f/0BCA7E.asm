; ---------------------------------------------------------------------------
; SavageBio_ActDie - SAVAGE bio script action: die - hide; with a companion, move it here and run its death script Tbl_SavageBio_Script5Len (jt $1E8A); without, end the scene in $F0 frames
; In:  8(a6) = this
; Out: d0
; Evidence: no companion: Scene_EndAfter($F0), g_SceneVar3B20 := 0, ExplodeFx_Chain(this, Tbl_ExplodeFxSpiralPath (jt $3B42), ...); TAS 33929
; Found: jt 1021
; ---------------------------------------------------------------------------
SavageBio_ActDie:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$B4(a4),a3
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a3,d0
	addq.w	#$8,a7
	beq.w	loc_0BCB52
	move.l	$8(a4),$8(a3)
	move.l	$C(a4),$C(a3)
	moveq	#$8,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BCAD2
	andi.b	#$F7,$2E(a3)
	bra.s	loc_0BCAD8
loc_0BCAD2:
	ori.b	#$8,$2E(a3)
loc_0BCAD8:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BCAE8
	andi.b	#$EF,$2E(a3)
	bra.s	loc_0BCAEE
loc_0BCAE8:
	ori.b	#$10,$2E(a3)
loc_0BCAEE:
	lea.l	$1E92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$3392(a5)	; -> BioBalls_SetFormation
	lea.l	$1E8A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a3)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$8E(a3)
	lea.l	$10(a7),a7
	bne.s	loc_0BCB22
	move.l	$64(a3),$5C(a3)
	clr.w	$6C(a3)
	bra.s	loc_0BCB3E
loc_0BCB22:
	clr.w	$8C(a3)
	movea.l	$8E(a3),a0
	addq.l	#$2,a0
	move.w	$8C(a3),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a3)
	clr.w	$6C(a3)
loc_0BCB3E:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateDeathWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BCB88
loc_0BCB52:
	pea.l	($F0).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B20(a5)
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$3B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AF2(a5)	; -> ExplodeFx_Chain
	lea.l	$18(a7),a7
loc_0BCB88:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
