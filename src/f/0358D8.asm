; ---------------------------------------------------------------------------
; AvalonA4_SetCameraZone - apply camera zone N (limits x0,y0,x1,y1 via g_Camera +$36) and set bit 1<<N in -$3B02
; In:  8(a6) = word zone 0-5, $C..$18(a6) = word x0, y0, x1, y1
; Out: none
; Evidence: g_Camera +$36(x0, y0, x1, y1, N != 3, 0); switch Sw_0358D8 -> mask; or.w into -$3B02
; ---------------------------------------------------------------------------
AvalonA4_SetCameraZone:
	link.w	a6,#$0
	movem.l	d3/d5-d7,-(a7)
	move.w	$A(a6),d7
	cmpi.w	#$3,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0358F2
	moveq	#$0,d0
	bra.s	loc_0358F4
loc_0358F2:
	moveq	#$1,d0
loc_0358F4:
	move.b	d0,d5
	clr.b	d6
	moveq	#$0,d0
	move.b	d6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	d5,d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	move.w	d7,d0
	lea.l	$1C(a7),a7
	bmi.s	AvalonA4_SetCameraZone_apply
	cmpi.w	#$5,d0
	bgt.s	AvalonA4_SetCameraZone_apply
	add.w	d0,d0
	move.w	Sw_0358D8(pc,d0.w),d0
	jmp	Sw_0358D8-2(pc,d0.w)
