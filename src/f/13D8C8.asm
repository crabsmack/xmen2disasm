; ---------------------------------------------------------------------------
; Ninja_ScrStepFacePlayer - combat-script thunks 1-2: jmp Ninja_ActFacePlayer, then (loc_13D8CC) jmp Ninja_ActLeap
; In:  a4 = this
; Out: none
; Evidence: first entries of Tbl_NinjaCombatScript (jt 1873)
; ---------------------------------------------------------------------------
Ninja_ScrStepFacePlayer:
	jmp	$3A52(a5)	; -> Ninja_ActFacePlayer
loc_13D8CC:
	jmp	$3A3A(a5)	; -> Ninja_ActLeap
