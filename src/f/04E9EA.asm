; ---------------------------------------------------------------------------
; loc_04E9EA
; ---------------------------------------------------------------------------
loc_04E9EA:
	tst.w	d7
	bne.s	loc_04E9FE
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	bra.s	loc_04EA38
loc_04E9FE:
	cmpi.w	#$10,d7
	bne.s	loc_04EA38
	andi.w	#$FFFD,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
loc_04EA38:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
