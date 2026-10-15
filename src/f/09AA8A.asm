; ---------------------------------------------------------------------------
; XClone_Script13 - AI-script jmp thunks (5 steps): XClone_ActFacePlayer, XClone_ActAttack, XClone_ActFacePlayer, XClone_ActAttack, XClone_ActMainScript
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script13:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09AA8E:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09AA92:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09AA96:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09AA9A:
	jmp	$17FA(a5)	; -> XClone_ActMainScript
