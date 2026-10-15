; ---------------------------------------------------------------------------
; Player1_StartLife_Wolverine - switch case 5/default (Wolverine) of Player1_StartLife, plus its common tail (store g_P1CharIndex, spend a life)
; In:  d7 = character index
; Out: d0 = 1
; Evidence: jump table $0062A2 entry 5 and the out-of-range branch -> Player1_SetWolverine; then g_P1CharIndex = d7, g_P1Lives -= 1
; ---------------------------------------------------------------------------
Player1_StartLife_Wolverine:
	jsr	Player1_SetWolverine(pc)
	move.b	d7,g_P1CharIndex(a5)
	subq.w	#$1,g_P1Lives(a5)
	moveq	#$1,d0
loc_0062DA:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
