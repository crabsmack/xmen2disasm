; ---------------------------------------------------------------------------
; Spr_EndFrame - terminate this frame's sprite list (link byte 0 on the last used slot)
; In:  none
; Out: none
; Evidence: last = -$1FE2 (forced to $4F when the list wrapped); g_SpriteTable+3+last*8 = 0; -$1FDE = last; called from Level_FrameLoop before the DMA flag is raised
; ---------------------------------------------------------------------------
Spr_EndFrame:
	link.w	a6,#$0
	move.l	d3,-(a7)
	moveq	#$50,d0
	cmp.w	-$1FE2(a5),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1FA9E8
	moveq	#$4F,d0
	bra.s	loc_1FA9EC
loc_1FA9E8:
	move.w	-$1FE2(a5),d0
loc_1FA9EC:
	move.w	d0,-$1FE2(a5)
	asl.w	#$3,d0
	lea.l	g_SpriteTable(a5),a0
	clr.b	$3(a0,d0.w)
	move.w	-$1FE2(a5),-$1FDE(a5)
	move.l	-$4(a6),d3
	unlk	a6
	rts
