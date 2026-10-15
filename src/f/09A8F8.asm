; ---------------------------------------------------------------------------
; XClone_Script11 - AI-script jmp thunks (4 steps): XClone_ActAttack, XClone_ActTurn, XClone_ActAttack, XClone_ActMainScript
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script11:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A8FC:
	jmp	$17B2(a5)	; -> XClone_ActTurn
loc_09A900:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A904:
	jmp	$17FA(a5)	; -> XClone_ActMainScript
