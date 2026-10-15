; ---------------------------------------------------------------------------
; BigAcolyte_FightScript - BIGACOLYTE fight AI script: 20 jmp thunks to the BigAcolyte_Act* actions
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_BigAcolyteFightScriptLen ($14); installed by BigAcolyte_ActStartFight
; ---------------------------------------------------------------------------
BigAcolyte_FightScript:
	jmp	$182(a5)	; -> BigAcolyte_ActRise1
