; ---------------------------------------------------------------------------
; Collide_RunAll - per-frame hit detection: player attackers vs enemy bodies, enemy attackers vs player bodies
; In:  none
; Out: none
; Evidence: skipped while g_SceneExitTimer runs; walks list $FFEBA2 against $FFEBAE and $FFEBAA against $FFEBA6 with Collide_ObjVsList
; ---------------------------------------------------------------------------
Collide_RunAll:
	link.w	a6,#$0
	move.l	a4,-(a7)
	tst.w	g_SceneExitTimer(a5)
	bne.s	loc_1FA0A6
	tst.l	g_HitListEnemyBody(a5)
	beq.s	loc_1FA086
	movea.l	g_HitListPlayerAtk(a5),a4
	bra.s	loc_1FA082
loc_1FA072:
	move.l	g_HitListEnemyBody(a5),-(a7)
	move.l	$8(a4),-(a7)
	jsr	Collide_ObjVsList(pc)
	movea.l	(a4),a4
	addq.w	#$8,a7
loc_1FA082:
	move.l	a4,d0
	bne.s	loc_1FA072
loc_1FA086:
	tst.l	g_HitListPlayerBody(a5)
	beq.s	loc_1FA0A6
	movea.l	g_HitListEnemyAtk(a5),a4
	bra.s	loc_1FA0A2
loc_1FA092:
	move.l	g_HitListPlayerBody(a5),-(a7)
	move.l	$8(a4),-(a7)
	jsr	Collide_ObjVsList(pc)
	movea.l	(a4),a4
	addq.w	#$8,a7
loc_1FA0A2:
	move.l	a4,d0
	bne.s	loc_1FA092
loc_1FA0A6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
