; ---------------------------------------------------------------------------
; sub_15C42A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_15C42A:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	clr.b	-$3A08(a5)
	jsr	$50FA(a5)	; -> Pad_Update
	tst.l	g_PauseCheatPtr(a5)
	beq.w	loc_15C5F2
	moveq	#$7F,d0
	and.w	g_Pad1Pressed(a5),d0
	beq.w	loc_15CA36
	moveq	#$7F,d6
	and.w	g_Pad1Pressed(a5),d6
	movea.l	g_PauseCheatPtr(a5),a0
	cmp.b	(a0),d6
	bne.w	loc_15C5E4
	addq.l	#$1,g_PauseCheatPtr(a5)
	movea.l	g_PauseCheatPtr(a5),a0
	moveq	#$0,d0
	move.b	(a0),d0
	cmpi.w	#$FF,d0
	bne.w	loc_15CA36
	move.w	-$3C58(a5),d0
	subq.w	#$1,d0
	bmi.w	loc_15C5D6
	cmpi.w	#$8,d0
	bgt.w	loc_15C5D6
	add.w	d0,d0
	move.w	Sw_15C42A(pc,d0.w),d0
	jmp	Sw_15C42A-2(pc,d0.w)
