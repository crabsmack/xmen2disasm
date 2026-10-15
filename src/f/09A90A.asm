; ---------------------------------------------------------------------------
; XClone_Script12 - AI-script jmp thunks (12 steps): XClone_ActBecomeBalls, EvilPsylocke_ActBallsPath, XClone_ActWait60, XClone_ActWait60, XClone_ActFacePlayer, XClone_ActBallsRoll, XClone_ActTurn, XClone_ActBallsRoll, XClone_ActStopSoundFE, XClone_ActWait60, XClone_ActBallsToFloor, XClone_ActLeaveBalls
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 64 run(s) (fuzz-01800-s1...)
; ---------------------------------------------------------------------------
XClone_Script12:
	jmp	$1742(a5)	; -> XClone_ActBecomeBalls
loc_09A90E:
	jmp	$18BA(a5)	; -> EvilPsylocke_ActBallsPath
loc_09A912:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A916:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A91A:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A91E:
	jmp	$17A2(a5)	; -> XClone_ActBallsRoll
loc_09A922:
	jmp	$17B2(a5)	; -> XClone_ActTurn
loc_09A926:
	jmp	$17A2(a5)	; -> XClone_ActBallsRoll
loc_09A92A:
	jmp	$1752(a5)	; -> XClone_ActStopSoundFE
loc_09A92E:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A932:
	jmp	$174A(a5)	; -> XClone_ActBallsToFloor
loc_09A936:
	jmp	$173A(a5)	; -> XClone_ActLeaveBalls
