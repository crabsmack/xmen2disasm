; ---------------------------------------------------------------------------
; Spr_BeginFrame - start building this frame's sprite list: undo last frame's terminator and point the writer before the first slot
; In:  none
; Out: none
; Evidence: if last index -$1FDE != $51: restore its link byte to index+1; write index -$1FE2 = $51, write pointer -$1FE6 = g_SpriteTable+$288; called from the scene loop Level_FrameLoop
; ---------------------------------------------------------------------------
Spr_BeginFrame:
	link.w	a6,#$0
	moveq	#$51,d0
	cmp.w	g_SprLast(a5),d0
	beq.s	loc_1FA9BC
	move.b	-$1FDD(a5),d0
	addq.b	#$1,d0
	move.w	g_SprLast(a5),d1
	asl.w	#$3,d1
	lea.l	g_SpriteTable(a5),a0
	move.b	d0,$3(a0,d1.w)
loc_1FA9BC:
	move.w	#$51,g_SprIndex(a5)
	lea.l	g_SpriteTable(a5),a0
	lea.l	$288(a0),a0
	move.l	a0,g_SprWritePtr(a5)
	unlk	a6
	rts
