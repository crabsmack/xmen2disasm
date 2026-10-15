; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode	[jt 1379]
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d0
	bmi.w	Deathbird_SetMoveMode_Default
	cmpi.w	#$A,d0
	bgt.w	Deathbird_SetMoveMode_Default
	add.w	d0,d0
	move.w	Sw_1117A0(pc,d0.w),d0
	jmp	Sw_1117A0-2(pc,d0.w)
