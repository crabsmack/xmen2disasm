; ---------------------------------------------------------------------------
; sub_0B042E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B042E:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	$1C02(a5)	; -> sub_0AD486
	tst.b	-$3A02(a5)
	bne.s	loc_0B0448
	jsr	sub_0B02F4(pc)
loc_0B0448:
	tst.b	-$38DE(a5)
	beq.s	loc_0B0464
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	jsr	$1C02(a5)	; -> sub_0AD486
	tst.b	-$3A02(a5)
	bne.s	loc_0B0464
	jsr	sub_0B02F4(pc)
loc_0B0464:
	unlk	a6
	rts
