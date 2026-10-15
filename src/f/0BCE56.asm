; ---------------------------------------------------------------------------
; SavageMediumBio_StateReady - SAVAGEMEDIUMBIO state: join the hit and collision lists, frame 6, start the script after $3C frames
; In:  8(a6) = this
; Out: none
; Evidence: TAS 33570
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageMediumBio_StateReady:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFFD,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	andi.w	#$FFFE,$6(a4)
	pea.l	g_HitListEnemyAtk(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$80(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	bne.s	loc_0BCEB0
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0BCECE
loc_0BCEB0:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0BCECE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
