; ---------------------------------------------------------------------------
; Tank_ScriptDrive - tank AI script thunks: pause, fire a rocket, drive on
; In:  a4 = tank
; Out: per action
; Evidence: jmp Tank_ActPause / Tank_ActFireRocket / TankLeft_ActDrive (jt $3E82)
; ---------------------------------------------------------------------------
Tank_ScriptDrive:
	jmp	$3C02(a5)	; -> Tank_ActPause
loc_14223E:
	jmp	$3BFA(a5)	; -> Tank_ActFireRocket
loc_142242:
	jmp	$3C42(a5)	; -> TankLeft_ActDrive
