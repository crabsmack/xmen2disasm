; ---------------------------------------------------------------------------
; XClone_Script2 - AI-script jmp thunks (9 steps): XClone_ActFacePlayer, XClone_ActApproachPlayer, XClone_ActBecomeBalls, XClone_ActBallsMotionC, XClone_ActSound8F, XClone_ActSoundFE, XClone_ActWait60, XClone_ActWait60, XClone_DieRestartMusic
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_Script2:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A31A:
	jmp	$17DA(a5)	; -> XClone_ActApproachPlayer
loc_09A31E:
	jmp	$1742(a5)	; -> XClone_ActBecomeBalls
loc_09A322:
	jmp	$1792(a5)	; -> XClone_ActBallsMotionC
loc_09A326:
	jmp	$16E2(a5)	; -> XClone_ActSound8F
loc_09A32A:
	jmp	$175A(a5)	; -> XClone_ActSoundFE
loc_09A32E:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A332:
	jmp	$1722(a5)	; -> XClone_ActWait60
loc_09A336:
	jmp	$16DA(a5)	; -> XClone_DieRestartMusic
