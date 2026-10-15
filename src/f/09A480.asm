; ---------------------------------------------------------------------------
; XClone_Script5 - AI-script jmp thunks (7 steps): XClone_ActFacePlayer, XClone_ActAnim3C, XClone_ActFacePlayer, XClone_ActAttack, XClone_ActTurn, XClone_ActWalkStep, XClone_ActWaitStopped
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script5:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A484:
	jmp	$17CA(a5)	; -> XClone_ActAnim3C
loc_09A488:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A48C:
	jmp	$17D2(a5)	; -> XClone_ActAttack
loc_09A490:
	jmp	$17B2(a5)	; -> XClone_ActTurn
loc_09A494:
	jmp	$17F2(a5)	; -> XClone_ActWalkStep
loc_09A498:
	jmp	$17EA(a5)	; -> XClone_ActWaitStopped
	jmp	$17FA(a5)	; -> XClone_ActMainScript
