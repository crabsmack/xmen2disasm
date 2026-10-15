; ---------------------------------------------------------------------------
; BanimazaDoor_Draw_part1 - part 1 of BanimazaDoor_Draw: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of BanimazaDoor_Draw
; Out: continues in BanimazaDoor_Draw
; Evidence: only reached by branches from BanimazaDoor_Draw
; ---------------------------------------------------------------------------
BanimazaDoor_Draw_part1:
	move.l	a4,-(a7)
	jsr	BanimazaDoor_DrawColumn(pc)
	addq.w	#$4,a7
	bra.s	BanimazaDoor_Draw_part2
loc_03A58E:
	move.l	a4,-(a7)
	jsr	BanimazaDoor_DrawColumn(pc)
	addq.w	#$4,a7
	bra.s	BanimazaDoor_Draw_part2
loc_03A598:
	move.w	$9C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$90(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8C(a4),-(a7)
	jsr	BanimazaDoor_DrawDebris(pc)
	lea.l	$C(a7),a7
