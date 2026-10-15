; ---------------------------------------------------------------------------
; XClone_LockArena_Case3 - XClone_LockArena switch case for type 3: theme 4 (next entries 5, 6, 7)
; Evidence: d7 = 4
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_LockArena_Case3:
	moveq	#$4,d7
	bra.s	XClone_LockArena_SetTheme
loc_0991D2:
	moveq	#$5,d7
	bra.s	XClone_LockArena_SetTheme
loc_0991D6:
	moveq	#$6,d7
	bra.s	XClone_LockArena_SetTheme
loc_0991DA:
	moveq	#$7,d7
