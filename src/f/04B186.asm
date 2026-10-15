; ---------------------------------------------------------------------------
; Apocalypse_ScriptA - APOCALYPSE AI script: Entrance, OrbitFrom180, RotateTo0, RotateTo180, FlyOff, StartMainScript (+ StartBombs)
; In:  a4 = this
; Out: none
; Evidence: jmp thunk table; see Apocalypse_StateEntrance etc.
; ---------------------------------------------------------------------------
Apocalypse_ScriptA:
	jmp	$A72(a5)	; -> Apocalypse_StateEntrance
loc_04B18A:
	jmp	$A92(a5)	; -> Apocalypse_ActOrbitFrom180
loc_04B18E:
	jmp	$AAA(a5)	; -> Apocalypse_StateRotateTo0
loc_04B192:
	jmp	$AB2(a5)	; -> Apocalypse_StateRotateTo180
loc_04B196:
	jmp	$A7A(a5)	; -> Apocalypse_ActFlyOff
loc_04B19A:
	jmp	$A82(a5)	; -> Apocalypse_ActStartMainScript
