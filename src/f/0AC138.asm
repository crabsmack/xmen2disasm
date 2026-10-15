; ---------------------------------------------------------------------------
; FloatBubble_Init_Speed2 - FloatBubble_Init speed case 1: max speed $200
; Evidence: switch target
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
FloatBubble_Init_Speed2:
	move.w	#$200,d7
	bra.s	FloatBubble_Init_SetSpeed
loc_0AC13E:
	move.w	#$300,d7
	bra.s	FloatBubble_Init_SetSpeed
loc_0AC144:
	move.w	#$400,d7
	bra.s	FloatBubble_Init_SetSpeed
