; ---------------------------------------------------------------------------
; XClone_Script10 - AI-script jmp thunks (9 steps): XClone_ActKeepDistance, XClone_ActStand30, XClone_ActFacePlayer, XClone_ActStopAnim46, EvilPsylocke_ActDash, XClone_ActStop, XClone_ActFacePlayer, XClone_ActAnim3C, XClone_ActAnim3C
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 64 run(s) (fuzz-01800-s1...)
; ---------------------------------------------------------------------------
XClone_Script10:
	jmp	$17E2(a5)	; -> XClone_ActKeepDistance
loc_09A8D6:
	jmp	$170A(a5)	; -> XClone_ActStand30
loc_09A8DA:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A8DE:
	jmp	$17C2(a5)	; -> XClone_ActStopAnim46
loc_09A8E2:
	jmp	$18B2(a5)	; -> EvilPsylocke_ActDash
loc_09A8E6:
	jmp	$16F2(a5)	; -> XClone_ActStop
loc_09A8EA:
	jmp	$17BA(a5)	; -> XClone_ActFacePlayer
loc_09A8EE:
	jmp	$17CA(a5)	; -> XClone_ActAnim3C
loc_09A8F2:
	jmp	$17CA(a5)	; -> XClone_ActAnim3C
