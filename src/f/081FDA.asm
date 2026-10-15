; ---------------------------------------------------------------------------
; loc_081FDA
; ---------------------------------------------------------------------------
loc_081FDA:
	movea.l	a4,a3
	lea.l	-$3940(a5),a4
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
