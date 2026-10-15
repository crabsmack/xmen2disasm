; ---------------------------------------------------------------------------
; XClone_Script8 - AI-script jmp thunks (5 steps): XClone_ActFacePlayer, XClone_ActAttack, XClone_ActFacePlayer, XClone_ActAttack, XClone_ActMainScript
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script8:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A826:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A82A:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A82E:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A832:
	jmp	$17FA(a5)	; -> XClone_ActMainScript
