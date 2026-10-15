; ---------------------------------------------------------------------------
; sub_15CA6C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_15CA6C:
	link.w	a6,#$0
	move.w	#$FF0F,d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	move.w	#$FF0F,d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_15CA88:
	clr.b	-$3A08(a5)
	move.b	#$1,g_DmaFlushReq(a5)
	jsr	sub_15C42A(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	tst.b	g_PauseExit(a5)
	beq.s	loc_15CA88
	unlk	a6
	rts
