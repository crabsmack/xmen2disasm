; ---------------------------------------------------------------------------
; Boot_DrawText - write a zero-terminated ASCII string as tile numbers (char - $20) at row/column of plane A ($C000)
; In:  a0 = string, d0 = byte: column, d1 = byte: row, a4 = VDP data, a5 = VDP control
; Out: none
; Evidence: VRAM address = $C000 + row*$80 + col*2 (command $40000003 base); used only by Boot_RegionCheck
; ---------------------------------------------------------------------------
Boot_DrawText:
	move.b	d1,d2
	andi.l	#$FF,d2
	swap	d2
	lsl.l	#$7,d2
	move.b	d0,d3
	andi.l	#$FF,d3
	swap	d3
	asl.l	#$1,d3
	add.l	d3,d2
	addi.l	#$40000003,d2
	move.l	d2,(a5)
loc_1F45D0:
	tst.b	(a0)
	beq.s	loc_1F45E2
	move.b	(a0)+,d2
	subi.b	#$20,d2
	andi.w	#$FF,d2
	move.w	d2,(a4)
	bra.s	loc_1F45D0
loc_1F45E2:
	rts
