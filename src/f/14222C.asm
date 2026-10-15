; ---------------------------------------------------------------------------
; Tank_ScriptDriveIn - tank AI script thunks: pause, fire a rocket, drive in
; In:  a4 = tank
; Out: per action
; Evidence: jmp Tank_ActPause / Tank_ActFireRocket / TankLeft_ActDriveIn (jt $3E7A)
; ---------------------------------------------------------------------------
Tank_ScriptDriveIn:
	jmp	$3C02(a5)	; -> Tank_ActPause
loc_142230:
	jmp	$3BFA(a5)	; -> Tank_ActFireRocket
loc_142234:
	jmp	$3C3A(a5)	; -> TankLeft_ActDriveIn
