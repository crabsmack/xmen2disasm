; ---------------------------------------------------------------------------
; XClone_Script4 - AI-script jmp thunks (4 steps): XClone_ActAttack, XClone_ActTurn, XClone_ActAttack, XClone_ActMainScript
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script4:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A35E:
	jmp	$17B2(a5)	; -> XClone_ActTurn
loc_09A362:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A366:
	jmp	$17FA(a5)	; -> XClone_ActMainScript
