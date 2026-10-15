; ---------------------------------------------------------------------------
; sub_0F4314	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F4314:
	link.w	a6,#$0
	movea.l	-$35B6(a5),a0
	move.w	#$C8,$42(a0)
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_0F4334
	jsr	$23F2(a5)	; -> sub_0DC2CE
loc_0F4334:
	tst.b	-$38DE(a5)
	beq.s	loc_0F434C
	move.l	g_FrameCounter(a5),d0
	addq.l	#$1,g_FrameCounter(a5)
	tst.b	-$3A02(a5)
	bne.s	loc_0F434C
	jsr	$23F2(a5)	; -> sub_0DC2CE
loc_0F434C:
	unlk	a6
	rts
