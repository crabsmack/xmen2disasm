; ---------------------------------------------------------------------------
; Ninja_ScrStepStartCombat - intro-script thunk 2: jmp Ninja_ActStartCombat
; In:  a4 = this
; Out: none
; Evidence: jmp $3A32(a5); entry 2 of Tbl_NinjaIntroScript (jt 1872, installed by Ninja_Init); the next label Tbl_NinjaCombatScript starts the combat script
; ---------------------------------------------------------------------------
Ninja_ScrStepStartCombat:
	jmp	$3A32(a5)	; -> Ninja_ActStartCombat
