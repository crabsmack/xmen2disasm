; ---------------------------------------------------------------------------
; Cerebro_PrintText_part1 - part 1 of Cerebro_PrintText: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Cerebro_PrintText
; Out: continues in Cerebro_PrintText
; Evidence: only reached by branches from Cerebro_PrintText
; ---------------------------------------------------------------------------
Cerebro_PrintText_part1:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E6C0,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	Cerebro_PrintText_part2
loc_06533A:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E680,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	Cerebro_PrintText_part2
loc_06534E:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E640,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	Cerebro_PrintText_part2
loc_065362:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E600,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
