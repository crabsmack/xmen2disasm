; ---------------------------------------------------------------------------
; sub_09984A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09984A:
	link.w	a6,#$0
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_099860
	jsr	$116A(a5)	; -> CloneA2_FlickerUpdate
loc_099860:
	tst.b	-$38DE(a5)
	beq.s	loc_099878
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	g_PalFadeActive(a5)
	bne.s	loc_099878
	jsr	$116A(a5)	; -> CloneA2_FlickerUpdate
loc_099878:
	tst.w	-$3B06(a5)
	ble.s	loc_099890
	tst.b	-$38DE(a5)
	beq.s	loc_099888
	moveq	#$2,d0
	bra.s	loc_09988A
loc_099888:
	moveq	#$1,d0
loc_09988A:
	ext.w	d0
	sub.w	d0,-$3B06(a5)
loc_099890:
	tst.w	-$3B06(a5)
	bge.s	loc_09989A
	clr.w	-$3B06(a5)
loc_09989A:
	unlk	a6
	rts
