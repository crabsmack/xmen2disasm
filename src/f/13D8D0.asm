; ---------------------------------------------------------------------------
; Ninja_ScrStepFacePlayer2 - combat-script thunks 3-7: face player, then attack, check leave, idle anim, wait (loc_13D8D4-loc_13D8E0)
; In:  a4 = this
; Out: none
; Evidence: jmp $3A52/$3A42/$3A4A/$3A5A/$3A62(a5) in Tbl_NinjaCombatScript
; ---------------------------------------------------------------------------
Ninja_ScrStepFacePlayer2:
	jmp	$3A52(a5)	; -> Ninja_ActFacePlayer
loc_13D8D4:
	jmp	$3A42(a5)	; -> Ninja_ActAttack
loc_13D8D8:
	jmp	$3A4A(a5)	; -> Ninja_ActCheckLeave
loc_13D8DC:
	jmp	$3A5A(a5)	; -> Ninja_ActIdleAnim
loc_13D8E0:
	jmp	$3A62(a5)	; -> Ninja_ActWait
