; ---------------------------------------------------------------------------
; FloatBubble_Init_Speed1 - FloatBubble_Init speed case 0: max speed $100
; Evidence: switch target; shares the tail
; ---------------------------------------------------------------------------
FloatBubble_Init_Speed1:
	move.w	#$100,d7
	bra.s	FloatBubble_Init_SetSpeed
