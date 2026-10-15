; ---------------------------------------------------------------------------
; loc_15F572	[static: row-output routine sub_15F37C selects when its mode arg $17(a6)=0 (lea into a3; the decoder calls jsr (a3) per row); writes each row long to RAM via (a4)+; mode 0 never used in the corpus]
; ---------------------------------------------------------------------------
loc_15F572:
	move.l	d4,(a4)+
	subq.w	#$1,d2
	beq.s	loc_15F57A
	rts
loc_15F57A:
	movea.l	(a7)+,a0
	rts
