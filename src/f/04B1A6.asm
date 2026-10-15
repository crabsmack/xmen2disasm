; ---------------------------------------------------------------------------
; Apocalypse_ScriptB - APOCALYPSE AI script: Entrance, OrbitFrom180, RotateTo0, ...
; In:  a4 = this
; Out: none
; Evidence: jmp thunk table
; ---------------------------------------------------------------------------
Apocalypse_ScriptB:
	jmp	$A72(a5)	; -> Apocalypse_StateEntrance
loc_04B1AA:
	jmp	$A92(a5)	; -> Apocalypse_ActOrbitFrom180
loc_04B1AE:
	jmp	$AAA(a5)	; -> Apocalypse_StateRotateTo0
loc_04B1B2:
	jmp	$AE2(a5)	; -> Apocalypse_ActGoNearPlayer
loc_04B1B6:
	jmp	$A9A(a5)	; -> Apocalypse_ActOrbitFrom0
loc_04B1BA:
	jmp	$AE2(a5)	; -> Apocalypse_ActGoNearPlayer
loc_04B1BE:
	jmp	$A9A(a5)	; -> Apocalypse_ActOrbitFrom0
