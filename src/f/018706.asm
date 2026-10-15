; ---------------------------------------------------------------------------
; ShootAcolyte_ScriptEnd - last entry of the SHOOTACOLYTE AI script: jmp ShootAcolyte_ActWait30
; In:  a4 = this
; Out: none
; Evidence: entry 4 of the script
; ---------------------------------------------------------------------------
ShootAcolyte_ScriptEnd:
	jmp	$37A(a5)	; -> ShootAcolyte_ActWait30
