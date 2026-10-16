; ---------------------------------------------------------------------------
; SavageA4_InitStats - SavageA4: fill the stats record its enemies share (attack 2, hurt sound 0, health 2, knockback 5/10/15/30, no hurt frame $FF) and set the boss health g_SceneVar3B02/g_SceneVar3B04 to 50
; In:  none
; Out: none
; Evidence: NpcStats record at g_SceneVar3B14 (stack buffer of SavageA4_RunScene); g_SceneVar3B06 := 0; jt 917; TAS 33301
; Found: jt 917
; ---------------------------------------------------------------------------
SavageA4_InitStats:
	link.w	a6,#$0
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$2,(a0)
	movea.l	g_SceneVar3B14(a5),a0
	clr.b	$1(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$2,$2(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$5,$3(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$A,$4(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$F,$5(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$1E,$6(a0)
	movea.l	g_SceneVar3B14(a5),a0
	move.b	#$FF,$7(a0)
	move.w	#$32,g_SceneVar3B02(a5)
	move.w	g_SceneVar3B02(a5),g_SceneVar3B04(a5)
	clr.w	g_SceneVar3B06(a5)
	unlk	a6
	rts
