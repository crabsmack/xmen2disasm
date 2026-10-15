; ---------------------------------------------------------------------------
; FloatBubble_SetDirection - FLOATBUBBLE: set the drift direction +$90 (0 up, 1 up-right, 2 right, 3 down-right, 4 down, 5 down-left, 6 left, 7 up-left): accelerations +-8 and speed signs
; In:  a4 = this
; Out: none
; Evidence: 8-case switch Sw_0AB526; callers FloatBubble_StateStart/StateRelease
; Found: link-after-rts
; ---------------------------------------------------------------------------
FloatBubble_SetDirection:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$90(a4),d0
	bmi.w	FloatBubble_SetDirection_Done
	cmpi.w	#$7,d0
	bgt.w	FloatBubble_SetDirection_Done
	add.w	d0,d0
	move.w	Sw_0AB526(pc,d0.w),d0
	jmp	Sw_0AB526-2(pc,d0.w)
