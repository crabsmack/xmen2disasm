; ---------------------------------------------------------------------------
; XClone_Script6 - AI-script jmp thunks (5 steps): XClone_ActStand10, XClone_ActAttack, XClone_ActTurn, XClone_ActAttack, XClone_ActMainScript
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script6:
	jmp	$1712(a5)	; -> XClone_ActStand10
loc_09A574:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A578:
	jmp	$17B2(a5)	; -> XClone_ActTurn
loc_09A57C:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A580:
	jmp	$17FA(a5)	; -> XClone_ActMainScript
