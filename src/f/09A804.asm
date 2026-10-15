; ---------------------------------------------------------------------------
; XClone_Script7 - AI-script jmp thunks (3 steps): XClone_ActCheckLowHealth, XClone_ActFacePlayer, XClone_ActApproachPlayer
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script7:
	jmp	$16EA(a5)	; -> XClone_ActCheckLowHealth
loc_09A808:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A80C:
	jmp	$17DA(a5)	; -> XClone_ActApproachPlayer
