; ---------------------------------------------------------------------------
; VDP_SetShadowHighlight - write VDP reg 12: H40 mode, with shadow/highlight when the flag is set ($8C89) or without ($8C81)
; In:  $B(a6) = byte flag
; Out: d0 = command word
; Evidence: writes $C00004; SpaceElev_Main turns it on for the stage and off after
; ---------------------------------------------------------------------------
VDP_SetShadowHighlight:
	link.w	a6,#$0
	move.l	d7,-(a7)
	tst.b	$B(a6)
	beq.s	loc_10B564
	move.w	#$89,d7
	bra.s	loc_10B568
loc_10B564:
	move.w	#$81,d7
loc_10B568:
	move.w	d7,d0
	add.w	#$8C00,d0
	move.w	d0,($C00004).l
	move.l	-$4(a6),d7
	unlk	a6
	rts
