; ---------------------------------------------------------------------------
; Apocalypse_ScriptC - APOCALYPSE AI script entries: RotateTo180, FlyOff, StartMainScript
; In:  a4 = this
; Out: none
; Evidence: jmp thunk table
; ---------------------------------------------------------------------------
Apocalypse_ScriptC:
	jmp	$AB2(a5)	; -> Apocalypse_StateRotateTo180
loc_04B1C6:
	jmp	$A7A(a5)	; -> Apocalypse_ActFlyOff
loc_04B1CA:
	jmp	$A82(a5)	; -> Apocalypse_ActStartMainScript
