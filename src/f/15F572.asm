; ---------------------------------------------------------------------------
; Nem_PutRowRam - Nemesis row writer: store the row long to RAM and advance
; In:  d4 = row, a4 = RAM dest, d2 = rows left
; Out: none
; Evidence: move.l d4,(a4)+; mode 0, not used in the corpus
; ---------------------------------------------------------------------------
Nem_PutRowRam:
	move.l	d4,(a4)+
	subq.w	#$1,d2
	beq.s	loc_15F57A
	rts
loc_15F57A:
	movea.l	(a7)+,a0
	rts
