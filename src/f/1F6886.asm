; ---------------------------------------------------------------------------
; Pal_ClearBase - zero the 64-colour base palette
; In:  none
; Out: none
; Evidence: 64 words of g_PalBase ($FFC880) cleared; caller Pal_FadeOutWait
; ---------------------------------------------------------------------------
Pal_ClearBase:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	clr.b	d7
	moveq	#$40,d3
loc_1F6892:
	ext.w	d7
	move.l	d7,d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	clr.w	(a0,d0.w)
	move.b	d7,d0
	addq.b	#$1,d7
	cmp.b	d7,d3
	bgt.s	loc_1F6892
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
