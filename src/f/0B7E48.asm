; ---------------------------------------------------------------------------
; SavageBio_Script2 - AI-script jmp thunks (3 steps): SavageBio_ActFrame4F, SavageBio_ActExtendShort, SavageBio_ActScript2052
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script2:
	jmp	$1FD2(a5)	; -> SavageBio_ActFrame4F
loc_0B7E4C:
	jmp	$1F62(a5)	; -> SavageBio_ActExtendShort
loc_0B7E50:
	jmp	$1F1A(a5)	; -> SavageBio_ActScript2052
