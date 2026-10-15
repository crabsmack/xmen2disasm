; ---------------------------------------------------------------------------
; AvalonA4_AnimatePalettes - AvalonA4 (Throne Room) palette animation: one 6-step sequence every 5 frames driven by a byte table, one 15-step sequence every 4 frames
; In:  none
; Out: d0
; Evidence: called from AvalonA4_FrameHook; counters -$3B32/-$3B3A (table jt $34D42, index byte -$3CB0) and -$3B34/-$3B3C; switches write g_PalBase colours; sets g_PalBaseDirty
; ---------------------------------------------------------------------------
AvalonA4_AnimatePalettes:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_034D96
	move.w	-$3B32(a5),d0
	subq.w	#$1,-$3B32(a5)
loc_034D96:
	tst.w	-$3B32(a5)
	bgt.w	loc_034F7A
	lea.l	$71A(a5),a0
	movea.l	$2(a0),a4
	move.w	#$5,-$3B32(a5)
	move.b	#$1,g_PalBaseDirty(a5)
	move.b	-$3CB0(a5),d0
	cmp.b	(a4),d0
	bne.s	loc_034DBE
	clr.b	-$3CB0(a5)
loc_034DBE:
	move.b	-$3CB0(a5),d0
	ext.w	d0
	ext.l	d0
	add.l	a4,d0
	movea.l	d0,a0
	tst.b	$1(a0)
	beq.w	AvalonA4_AnimatePalettes_part2
	move.w	-$3B3A(a5),d0
	bmi.w	AvalonA4_AnimatePalettes_part4
	cmpi.w	#$5,d0
	bgt.w	AvalonA4_AnimatePalettes_part4
	add.w	d0,d0
	move.w	Sw_034D7A(pc,d0.w),d0
	jmp	Sw_034D7A-2(pc,d0.w)
