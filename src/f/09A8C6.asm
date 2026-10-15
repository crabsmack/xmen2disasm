; ---------------------------------------------------------------------------
; XClone_Script9 - AI-script jmp thunks (3 steps): XClone_ActCheckLowHealth, XClone_ActStandAnim, XClone_ActFacePlayer
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script9:
	jmp	$16EA(a5)	; -> XClone_ActCheckLowHealth
loc_09A8CA:
	jmp	$16FA(a5)	; -> XClone_ActStandAnim
loc_09A8CE:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
