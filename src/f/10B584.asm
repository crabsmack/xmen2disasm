; ---------------------------------------------------------------------------
; Elevator_GetSize - Elevator (SpaceA1 lift controller, non-actor): return size $14
; In:  none
; Out: d0 = $14
; Evidence: method 0 of class descriptor $10B532 ("ELEVATOR"); built on the stack by SpaceElev_Main
; ---------------------------------------------------------------------------
Elevator_GetSize:
	link.w	a6,#$0
	moveq	#$14,d0
	unlk	a6
	rts
