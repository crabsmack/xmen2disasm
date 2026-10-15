; ---------------------------------------------------------------------------
; Spr_EmitPre_Piece - Spr_EmitPre inner loop: write one piece to the next sprite slot and finish the frame
; In:  registers of Spr_EmitPre
; Out: none
; Evidence: (a4) = y/size/link, 4(a4) = attr/x; a3 += 6; at the end stores write pointer g_SprWritePtr and adds the count to g_SprIndex
; ---------------------------------------------------------------------------
Spr_EmitPre_Piece:
	swap	d6
	move.w	d4,d6
	asl.w	#$7,d6
	addq.l	#$8,a4
	move.b	$3(a4),d6
	move.l	d6,(a4)
	move.l	d7,$4(a4)
	addq.w	#$6,a3
	addq.w	#$1,d5
loc_1FB88A:
	cmp.b	d3,d5
	blt.w	loc_1FB7E2
	move.l	a4,g_SprWritePtr(a5)
	add.w	d5,g_SprIndex(a5)
loc_1FB898:
	movem.l	-$24(a6),d3-d7/a2-a4
	unlk	a6
	rts
