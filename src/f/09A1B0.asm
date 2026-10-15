; ---------------------------------------------------------------------------
; XClone_Script1 - AI-script jmp thunks (12 steps): XClone_ActOpenBioBalls, XClone_ActSoundEF, XClone_ActBallsToFloor, XClone_ActCloseBioBalls, XClone_ActStand60, XClone_ActBecomeBalls, XClone_ActSoundEF, XClone_ActBallsMotionC, XClone_ActWait60, XClone_ActSoundFA, XClone_ActBallsMotionD, XClone_KillAndCount
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script1:
	jmp	$16CA(a5)	; -> XClone_ActOpenBioBalls
loc_09A1B4:
	jmp	$16BA(a5)	; -> XClone_ActSoundEF
loc_09A1B8:
	jmp	$174A(a5)	; -> XClone_ActBallsToFloor
loc_09A1BC:
	jmp	$16D2(a5)	; -> XClone_ActCloseBioBalls
loc_09A1C0:
	jmp	$1702(a5)	; -> XClone_ActStand60
loc_09A1C4:
	jmp	$1742(a5)	; -> XClone_ActBecomeBalls
loc_09A1C8:
	jmp	$16BA(a5)	; -> XClone_ActSoundEF
loc_09A1CC:
	jmp	$1792(a5)	; -> XClone_ActBallsMotionC
loc_09A1D0:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A1D4:
	jmp	$16C2(a5)	; -> XClone_ActSoundFA
loc_09A1D8:
	jmp	$179A(a5)	; -> XClone_ActBallsMotionD
loc_09A1DC:
	jmp	$18E2(a5)	; -> XClone_KillAndCount
