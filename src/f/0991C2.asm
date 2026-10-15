; ---------------------------------------------------------------------------
; XClone_LockArena_Case1 - XClone_LockArena switch case for type 1: theme 1
; Evidence: d7 = 1 (the next entry sets 2); falls into XClone_LockArena_SetTheme
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_LockArena_Case1:
	moveq	#$1,d7
	bra.s	XClone_LockArena_SetTheme
loc_0991C6:
	moveq	#$2,d7
	bra.s	XClone_LockArena_SetTheme
