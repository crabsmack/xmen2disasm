; ---------------------------------------------------------------------------
; FloatBubble_Init_Speed5 - FloatBubble_Init speed case 4: max speed $500
; Evidence: switch target
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
FloatBubble_Init_Speed5:
	move.w	#$500,d7
