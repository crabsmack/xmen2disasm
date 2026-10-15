; ---------------------------------------------------------------------------
; CapedAcolyte_IntroScript - CAPEDACOLYTE first AI script: 3 jmp thunks (AnimHigh, FacePlayer, StartMainScript)
; In:  a4 = this
; Out: none
; Evidence: preceded by word count 3 at $013EC4
; ---------------------------------------------------------------------------
CapedAcolyte_IntroScript:
	jmp	$272(a5)	; -> CapedAcolyte_ActAnimHigh
loc_013ECA:
	jmp	$25A(a5)	; -> CapedAcolyte_ActFacePlayer
loc_013ECE:
	jmp	$252(a5)	; -> CapedAcolyte_ActStartMainScript
