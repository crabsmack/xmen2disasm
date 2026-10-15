; ---------------------------------------------------------------------------
; CloneA2_FlickerUpdate - per-frame palette animation for CloneA2 Vertical Corridor 1: flicker palette line 0 colours 13/14 and step colour 15
; In:  none
; Out: none
; Evidence: every 2 frames steps backwards through Tbl_CloneA2FlickerPattern: 1 -> colours 13/14 = $068/$8CC, else $468/$8EE; every 9 frames a 6-case switch puts $A0/$80/$C0 in colour 15 (g_PalBase+$1E); sets g_PalBaseDirty; called from CloneA2_FrameHook unless -$3A02/-$3B04 set; TAS 47933-57465
; ---------------------------------------------------------------------------
CloneA2_FlickerUpdate:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	lea.l	Tbl_CloneA2FlickerPattern(pc),a4
	tst.w	g_SceneVar3B32(a5)
	bne.s	loc_081C3C
	move.w	#$2,g_SceneVar3B32(a5)
	tst.w	g_SceneVar3B3A(a5)
	bne.s	loc_081C0A
	move.w	#$1A,g_SceneVar3B3A(a5)
loc_081C0A:
	subq.w	#$1,g_SceneVar3B3A(a5)
	move.w	g_SceneVar3B3A(a5),d0
	move.b	(a4,d0.w),d0
	subq.b	#$1,d0
	move.b	d0,d7
	beq.s	loc_081C2A
	move.w	#$468,g_PalBase+$1A(a5)
	move.w	#$8EE,g_PalBase+$1C(a5)
	bra.s	loc_081C36
loc_081C2A:
	move.w	#$68,g_PalBase+$1A(a5)
	move.w	#$8CC,g_PalBase+$1C(a5)
loc_081C36:
	move.b	#$1,g_PalBaseDirty(a5)
loc_081C3C:
	subq.w	#$1,g_SceneVar3B32(a5)
	tst.w	g_SceneVar3B34(a5)
	bne.s	loc_081CB6
	move.w	#$9,g_SceneVar3B34(a5)
	tst.w	g_SceneVar3B3C(a5)
	bne.s	loc_081C58
	move.w	#$6,g_SceneVar3B3C(a5)
loc_081C58:
	subq.w	#$1,g_SceneVar3B3C(a5)
	move.w	g_SceneVar3B3C(a5),d0
	bmi.s	CloneA2_FlickerUpdate_SetColor15
	cmpi.w	#$5,d0
	bgt.s	CloneA2_FlickerUpdate_SetColor15
	add.w	d0,d0
	move.w	Sw_081BE6(pc,d0.w),d0
	jmp	Sw_081BE6-2(pc,d0.w)
