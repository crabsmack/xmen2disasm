; ---------------------------------------------------------------------------
; XClone_LockArena_Case4 - XClone_LockArena switch case for type 4: theme 3
; Evidence: d7 = 3
; Found: static: switch-table case target (tools/switches.py: table after `move.w T(pc,dN.w),dN / jmp T-2(pc,dN.w)`, size from the cmpi bound)
; ---------------------------------------------------------------------------
XClone_LockArena_Case4:
	moveq	#$3,d7
	bra.s	XClone_LockArena_SetTheme
