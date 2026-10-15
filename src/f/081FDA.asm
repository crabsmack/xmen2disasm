; ---------------------------------------------------------------------------
; CloneA2_BgPalTimer_Copy - tail of CloneA2_BgPalTimer: copy 16 words from a4 to palette line 2 and mark the palette dirty
; In:  a4 = source palette
; Evidence: copies to -$3940 (g_PalBase+$40), sets g_PalBaseDirty
; ---------------------------------------------------------------------------
CloneA2_BgPalTimer_Copy:
	movea.l	a4,a3
	lea.l	g_PalBase+$40(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
loc_081FE4:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_081FE4
	move.b	#$1,g_PalBaseDirty(a5)
loc_081FF4:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
