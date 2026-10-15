; ---------------------------------------------------------------------------
; Sys_GetStackPtr - return the current stack pointer as a 24-bit address
; In:  none
; Out: d0 = a7 & $FFFFFF
; Evidence: two instructions; called by Mem_StackAlloc (value discarded, likely a removed heap/stack collision check)
; ---------------------------------------------------------------------------
Sys_GetStackPtr:
	move.l	a7,d0
	andi.l	#$FFFFFF,d0
	rts
