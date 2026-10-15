; ---------------------------------------------------------------------------
; Player2_StartLife_Wolverine - switch case 5/default (Wolverine) of Player2_StartLife, plus its common tail (store g_P2CharIndex, spend a life)
; In:  d7 = character index
; Out: d0 = 1
; Evidence: jump table $006344 entry 5 / default -> Player2_SetWolverine; g_P2CharIndex = d7, g_P2Lives -= 1
; ---------------------------------------------------------------------------
Player2_StartLife_Wolverine:
	jsr	Player2_SetWolverine(pc)
	move.b	d7,g_P2CharIndex(a5)
	subq.w	#$1,g_P2Lives(a5)
	moveq	#$1,d0
loc_00637C:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
