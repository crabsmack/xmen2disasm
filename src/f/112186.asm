; ---------------------------------------------------------------------------
; Deathbird_Move_Polar - Deathbird_Move kind 4: circling flight via Deathbird_MovePolar
; In:  inside Deathbird_Move (a4 = this, d5 = steps)
; Out: -
; Evidence: switch target in Deathbird_Move
; ---------------------------------------------------------------------------
Deathbird_Move_Polar:
	ext.l	d5
	move.l	d5,-(a7)
	pea.l	$1C(a4)
	pea.l	$1A(a4)
	pea.l	$18(a4)
	pea.l	$16(a4)
	pea.l	$C(a4)
	pea.l	$8(a4)
	pea.l	g_SceneVar3B28(a5)
	pea.l	g_SceneVar3B24(a5)
	pea.l	g_SceneVar3B20(a5)
	pea.l	$90(a4)
	pea.l	$8E(a4)
	pea.l	$8C(a4)
	jsr	Deathbird_MovePolar(pc)
	lea.l	$34(a7),a7
	bra.w	Deathbird_Move_Done
