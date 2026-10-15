; ---------------------------------------------------------------------------
; XClone_ActLeaveBalls - XCLONE script action: come back out of the BIOBALLS form - remove the child (sound $F2), become hittable, run the main script (record +8)
; In:  8(a6) = this
; Out: none
; Evidence: -$3B30 := this; HitList_Add(this, $FFEBAE); AiScript_Set(+$96, record + word 8); jt 739
; Found: jt 739
; ---------------------------------------------------------------------------
XClone_ActLeaveBalls:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_096836
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$9C(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.l	a4,g_SceneVar3B30(a5)
	andi.w	#$FFFD,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	$24(a7),a7
loc_096836:
	tst.l	$98(a4)
	bne.s	loc_096848
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096874
loc_096848:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_09685C
	clr.w	$96(a4)
loc_09685C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096874:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
