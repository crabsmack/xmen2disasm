; ---------------------------------------------------------------------------
; Spr_EmitStream_Piece - Spr_EmitStream inner loop: write one piece, advance the tile number by Tbl_SprTilesStream, finish the frame
; In:  registers of Spr_EmitStream
; Out: none
; Evidence: a4 += 8 (ROM piece), stores g_SprWritePtr/g_SprIndex at the end
; ---------------------------------------------------------------------------
Spr_EmitStream_Piece:
	swap	d6
	addq.w	#$8,a1
	move.b	$3(a1),d6
	move.l	d6,(a1)
	move.l	d7,$4(a1)
	swap	d7
	add.w	Tbl_SprTilesStream(pc,d3.w),d7
	addq.w	#$8,a4
	addq.w	#$1,d5
loc_1FBB46:
	cmp.b	d0,d5
	blt.w	loc_1FBA88
	move.l	a1,g_SprWritePtr(a5)
	add.w	d5,g_SprIndex(a5)
loc_1FBB54:
	movem.l	-$28(a6),d2-d7/a2-a4
	unlk	a6
	rts
