; ---------------------------------------------------------------------------
; Platform1_SteerByPad - Platform1 ridden by a player: set speed +$16 to +/- the platform speed from the rider's held d-pad, axis chosen by the floor segment type ($21/$22 left-right, $23/default up-down)
; In:  8(a6) = this  $C(a6) = player
; Out: d0
; Evidence: g_Pad1Held/g_Pad2Held by player +$9D; button masks -$3B98 (Left 4), -$3B9A (Right 8), -$3B9E (Up 1), -$3BA0 (Down 2) from Game_InitButtonMasks; segment +$76 byte 1
; ---------------------------------------------------------------------------
Platform1_SteerByPad:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	tst.w	$94(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_106F64
	move.w	$94(a4),d0
	ext.l	d0
	bra.s	loc_106F6C
loc_106F64:
	move.w	$94(a4),d0
	ext.l	d0
	neg.l	d0
loc_106F6C:
	move.w	d0,d7
	movea.l	$76(a4),a0
	move.b	$1(a0),d0
	subi.b	#$21,d0
	bmi.w	Platform1_SteerByPad_UpDown
	cmpi.b	#$3,d0
	bgt.w	Platform1_SteerByPad_UpDown
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_106F42(pc,d1.w),d1
	jmp	Sw_106F42-2(pc,d1.w)
