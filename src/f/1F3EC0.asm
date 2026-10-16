; ---------------------------------------------------------------------------
; XClimber_CheckGrab - XCLIMBER slot +$96: in the air, decide whether to grab the wall or ceiling segment just touched
; In:  8(a6) = player
; Out: d0 = 1 grab (state +$AA follows), 0 no
; Evidence: B press opens a 20-frame grab window (+$A8 actionTimer; a grab needs it running); last touched segment g_Segs[+$7B] via +$F2 ClassifySeg; ceiling needs Up held; walls refused past the top/bottom (Player_TopAboveSeg/BottomBelowSeg) or when falling fast (|vy| >= $1050); stores the segment in +$BC and the kind in +$C0 bits 0-1
; ---------------------------------------------------------------------------
XClimber_CheckGrab:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	d7
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F3EDE
	moveq	#$0,d0
	bra.w	loc_1F412C
loc_1F3EDE:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3F08
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1F3F10
loc_1F3F08:
	move.w	g_PadMaskB(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1F3F10:
	beq.s	loc_1F3F20
	move.w	#$14,$A8(a4)
	andi.w	#$FFBF,$C0(a4)
	bra.s	loc_1F3F58
loc_1F3F20:
	moveq	#$0,d0
	move.w	$C0(a4),d0
	move.w	#$100,d1
	and.w	d0,d1
	beq.s	loc_1F3F58
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F3F42
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad1Pressed(a5),d0
	bra.s	loc_1F3F4A
loc_1F3F42:
	move.w	g_PadMaskC(a5),d0
	and.w	g_Pad2Pressed(a5),d0
loc_1F3F4A:
	beq.s	loc_1F3F58
	move.w	#$A,$A8(a4)
	ori.w	#$40,$C0(a4)
loc_1F3F58:
	move.w	#$100,d0
	and.w	$4(a4),d0
	bne.s	loc_1F3F6E
	move.w	#$80,d0
	and.w	$4(a4),d0
	beq.w	loc_1F4020
loc_1F3F6E:
	moveq	#$0,d0
	move.b	$7B(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$F2(a0),a1
	jsr	(a1)
	move.w	d0,d7
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$D,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$2,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	move.w	d7,d0
	addq.w	#$8,a7
	bmi.s	XClimber_CheckGrab_Default
	cmpi.w	#$3,d0
	bgt.s	XClimber_CheckGrab_Default
	add.w	d0,d0
	move.w	Sw_1F3EC0(pc,d0.w),d0
	jmp	Sw_1F3EC0-2(pc,d0.w)
