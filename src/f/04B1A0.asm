; ---------------------------------------------------------------------------
; Apocalypse_ScriptBomb - APOCALYPSE AI script entry: StartBombs
; In:  a4 = this
; Out: none
; Evidence: jmp thunk
; ---------------------------------------------------------------------------
Apocalypse_ScriptBomb:
	jmp	$A8A(a5)	; -> Apocalypse_ActStartBombs
