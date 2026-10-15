; ---------------------------------------------------------------------------
; ChildShip_Script - AI-script jmp thunks (1 steps): ChildShip_ActDropRocket
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
ChildShip_Script:
	jmp	$1D5A(a5)	; -> ChildShip_ActDropRocket
	jmp	$1D6A(a5)	; -> ChildShip_ActWait20
	jmp	$1D5A(a5)	; -> ChildShip_ActDropRocket
	jmp	$1D62(a5)	; -> ChildShip_ActWait60
	jmp	$1D72(a5)	; -> ChildShip_ActOverPlayer
	jmp	$1D6A(a5)	; -> ChildShip_ActWait20
