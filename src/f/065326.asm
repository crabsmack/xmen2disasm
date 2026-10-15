; ---------------------------------------------------------------------------
; loc_065326	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_065326:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E6C0,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	loc_065374
loc_06533A:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E680,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	loc_065374
loc_06534E:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E640,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
	bra.s	loc_065374
loc_065362:
	move.b	(a4),d0
	ext.w	d0
	add.w	#$E600,d0
	sub.w	#$20,d0
	move.w	d0,($C00000).l
