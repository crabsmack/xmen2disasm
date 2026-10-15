; ---------------------------------------------------------------------------
; Nem_PutRowVdp - Nemesis row writer: store the row long to the VDP data port; return from the decode when all rows are done
; In:  d4 = row, a4 = $C00000, d2 = rows left
; Out: none
; Evidence: move.l d4,(a4); subq d2; on 0 pops the caller frame (movea.l (a7)+,a0 / rts) so Nem_Decode returns; mode 1
; ---------------------------------------------------------------------------
Nem_PutRowVdp:
	move.l	d4,(a4)
	subq.w	#$1,d2
	beq.s	loc_15F56E
	rts
loc_15F56E:
	movea.l	(a7)+,a0
	rts
