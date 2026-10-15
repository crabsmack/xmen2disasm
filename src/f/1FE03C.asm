; ---------------------------------------------------------------------------
; Pad_ReadBoth - read both joypads into their raw globals (V-int)
; In:  none
; Out: none
; Evidence: Pad_ReadPort(0) -> word -$7A8(a5), Pad_ReadPort(1) -> word -$7A6(a5); called by Irq_VBlank every frame
; ---------------------------------------------------------------------------
Pad_ReadBoth:
	moveq	#$0,d0
	jsr	$50CA(a5)	; -> Pad_ReadPort
	move.w	d0,-$7A8(a5)
	moveq	#$1,d0
	jsr	$50CA(a5)	; -> Pad_ReadPort
	move.w	d0,-$7A6(a5)
	rts
