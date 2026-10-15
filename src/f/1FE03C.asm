; ---------------------------------------------------------------------------
; Pad_ReadBoth - read both joypads into their raw globals (V-int)
; In:  none
; Out: none
; Evidence: Pad_ReadPort(0) -> word g_Pad1Raw(a5), Pad_ReadPort(1) -> word g_Pad2Raw(a5); called by Irq_VBlank every frame
; ---------------------------------------------------------------------------
Pad_ReadBoth:
	moveq	#$0,d0
	jsr	$50CA(a5)	; -> Pad_ReadPort
	move.w	d0,g_Pad1Raw(a5)
	moveq	#$1,d0
	jsr	$50CA(a5)	; -> Pad_ReadPort
	move.w	d0,g_Pad2Raw(a5)
	rts
