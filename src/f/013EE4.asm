; ---------------------------------------------------------------------------
; CapedAcolyte_MainScriptEnd - last entry of the CAPEDACOLYTE main AI script: jmp CapedAcolyte_ActFacePlayer
; In:  a4 = this
; Out: none
; Evidence: entry 5 of the script at Tbl_CapedAcolyteMainScriptLen
; ---------------------------------------------------------------------------
CapedAcolyte_MainScriptEnd:
	jmp	$25A(a5)	; -> CapedAcolyte_ActFacePlayer
