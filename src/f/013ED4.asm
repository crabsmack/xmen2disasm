; ---------------------------------------------------------------------------
; CapedAcolyte_MainScript - CAPEDACOLYTE main AI script: jmp thunks AnimLow, Hover, FacePlayer, ShootBurst (+ FacePlayer at CapedAcolyte_MainScriptEnd)
; In:  a4 = this
; Out: none
; Evidence: preceded by Tbl_CapedAcolyteMainScriptLen (5); installed by CapedAcolyte_ActStartMainScript
; ---------------------------------------------------------------------------
CapedAcolyte_MainScript:
	jmp	$27A(a5)	; -> CapedAcolyte_ActAnimLow
loc_013ED8:
	jmp	$26A(a5)	; -> CapedAcolyte_ActHover
loc_013EDC:
	jmp	$25A(a5)	; -> CapedAcolyte_ActFacePlayer
loc_013EE0:
	jmp	$262(a5)	; -> CapedAcolyte_ActShootBurst
