; ---------------------------------------------------------------------------
; ShootAcolyte_Script - SHOOTACOLYTE AI script: jmp thunks Walk, FacePlayer, ShootBurst (+ Wait30 at ShootAcolyte_ScriptEnd)
; In:  a4 = this
; Out: none
; Evidence: preceded by word count 4 at $0186F8
; ---------------------------------------------------------------------------
ShootAcolyte_Script:
	jmp	$38A(a5)	; -> ShootAcolyte_ActWalk
loc_0186FE:
	jmp	$382(a5)	; -> ShootAcolyte_ActFacePlayer
loc_018702:
	jmp	$392(a5)	; -> ShootAcolyte_ActShootBurst
