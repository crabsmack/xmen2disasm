; ---------------------------------------------------------------------------
; CloneA1_CyclePalettes - advance the CloneA1 palette cycles (two tables sharing one counter set)
; In:  none
; Out: none
; Evidence: Pal_CycleStep (palette cycle step) with jt $773BE (counters left unchanged) and jt $773E0 (counters advanced)
; ---------------------------------------------------------------------------
CloneA1_CyclePalettes:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$10BA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3A(a5)
	pea.l	g_SceneVar3B42(a5)
	pea.l	g_SceneVar3B32(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$10C2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	g_SceneVar3B3A(a5)
	pea.l	g_SceneVar3B42(a5)
	pea.l	g_SceneVar3B32(a5)
	jsr	$3EB2(a5)	; -> Pal_CycleStep
	unlk	a6
	rts
