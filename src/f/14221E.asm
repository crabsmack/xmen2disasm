; ---------------------------------------------------------------------------
; Tank_ScriptWaitDrive - tank AI script thunks (the jt exports the count word before them): pause, fire a rocket, wait then drive
; In:  a4 = tank (script thunks are jumped to as states)
; Out: per action
; Evidence: jmp Tank_ActPause / Tank_ActFireRocket / TankLeft_ActWaitDrive; script table set with AiScript_Set (jt $3E72)
; ---------------------------------------------------------------------------
Tank_ScriptWaitDrive:
	jmp	$3C02(a5)	; -> Tank_ActPause
loc_142222:
	jmp	$3BFA(a5)	; -> Tank_ActFireRocket
loc_142226:
	jmp	$3C32(a5)	; -> TankLeft_ActWaitDrive
