; ---------------------------------------------------------------------------
; XClone_Script3 - AI-script jmp thunks (2 steps): XClone_ActCheckLowHealth, XClone_ActFacePlayer
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script3:
	jmp	$16EA(a5)	; -> XClone_ActCheckLowHealth
loc_09A340:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
