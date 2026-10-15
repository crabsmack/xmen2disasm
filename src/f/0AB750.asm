; ---------------------------------------------------------------------------
; FloatBubble_SetDirection_Done - FloatBubble_SetDirection common exit
; Evidence: switch exit
; ---------------------------------------------------------------------------
FloatBubble_SetDirection_Done:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
