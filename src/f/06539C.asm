; ---------------------------------------------------------------------------
; PlayerSelect_CheckDone - start the select-screen exit countdown once every present player has confirmed
; In:  none
; Out: none
; Evidence: cursor +$40 = confirmed, +$3C = -1 absent (cursors g_SceneVar3B28/g_SceneVar3B2C); sets countdown g_SceneExitTimer = 2
; ---------------------------------------------------------------------------
PlayerSelect_CheckDone:
	link.w	a6,#$0
	tst.w	g_SceneExitTimer(a5)
	bne.s	loc_0653FC
	movea.l	g_SceneVar3B2C(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	bne.s	loc_0653C4
	movea.l	g_SceneVar3B28(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653C4
	move.w	#$2,g_SceneExitTimer(a5)
	bra.s	loc_0653FC
loc_0653C4:
	movea.l	g_SceneVar3B28(a5),a0
	moveq	#-$1,d0
	cmp.b	$3C(a0),d0
	bne.s	loc_0653E2
	movea.l	g_SceneVar3B2C(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653E2
	move.w	#$2,g_SceneExitTimer(a5)
	bra.s	loc_0653FC
loc_0653E2:
	movea.l	g_SceneVar3B28(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653FC
	movea.l	g_SceneVar3B2C(a5),a0
	tst.b	$40(a0)
	beq.s	loc_0653FC
	move.w	#$2,g_SceneExitTimer(a5)
loc_0653FC:
	unlk	a6
	rts
