; ---------------------------------------------------------------------------
; CloneA2_FlickerUpdate_SetColor15 - tail of CloneA2_FlickerUpdate: store d7 in palette line 0 colour 15, mark the palette dirty, count down -$3B34
; In:  d7 = colour
; Evidence: writes g_PalBase+$1E (-$3962) and g_PalBaseDirty; reached from the switch cases and the default path
; ---------------------------------------------------------------------------
CloneA2_FlickerUpdate_SetColor15:
	move.w	d7,-$3962(a5)
	move.b	#$1,g_PalBaseDirty(a5)
loc_081CB6:
	subq.w	#$1,-$3B34(a5)
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
