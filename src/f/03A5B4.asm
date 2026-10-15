; ---------------------------------------------------------------------------
; BanimazaDoor_Draw_part2 - part 2 of BanimazaDoor_Draw: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of BanimazaDoor_Draw
; Out: continues in BanimazaDoor_Draw
; Evidence: only reached by branches from BanimazaDoor_Draw; ends with rts
; ---------------------------------------------------------------------------
BanimazaDoor_Draw_part2:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
