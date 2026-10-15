; ---------------------------------------------------------------------------
; SavageBio_StateDeathExplode - SAVAGE bio death: every 16 frames blow up one companion segment; when the timer ends, end the scene in $F0 frames and remove itself
; In:  8(a6) = this
; Out: d0
; Evidence: plain ACTOR + ExplodeFx_BurstMedium at each segment; Scene_EndAfter($F0), g_SceneVar3B20 := 0, slot +$52; TAS 34116-34355
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateDeathExplode:
	link.w	a6,#$FFF8
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$B4(a4),-$8(a6)
	tst.w	$6E(a4)
	bgt.s	loc_0BCBC8
	pea.l	($F0).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	moveq	#$0,d0
	move.l	d0,g_SceneVar3B20(a5)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_0BCC60
loc_0BCBC8:
	moveq	#$F,d0
	and.w	$6E(a4),d0
	bne.s	loc_0BCC4E
	tst.l	-$8(a6)
	beq.s	loc_0BCC4E
	movea.l	-$8(a6),a0
	movea.l	$92(a0),a3
	addq.w	#$2,a3
	movea.l	$92(a0),a0
	move.w	(a0),d6
	move.w	$6E(a4),d0
	asr.w	#$4,d0
	move.w	d6,d7
	sub.w	d0,d7
	tst.w	d7
	blt.s	loc_0BCC4E
	ext.l	d7
	move.l	d7,d1
	add.l	d1,d1
	move.l	d1,d0
	add.l	d0,d0
	add.l	d0,d1
	adda.l	d1,a3
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$2(a3),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	(a3),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	d0,-$4(a6)
	lea.l	$14(a7),a7
	beq.s	loc_0BCC44
	move.l	-$4(a6),-(a7)
	jsr	$3ACA(a5)	; -> ExplodeFx_BurstMedium
	addq.w	#$4,a7
loc_0BCC44:
	move.w	#$FFFF,(a3)
	move.w	#$FFFF,$2(a3)
loc_0BCC4E:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateDeathExplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BCC60:
	movem.l	-$18(a6),d6-d7/a3-a4
	unlk	a6
	rts
