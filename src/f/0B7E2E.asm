; ---------------------------------------------------------------------------
; SavageBio_Script1 - AI-script jmp thunks (6 steps): SavageBio_ActCrossIfUp, SavageBio_ActFrame4F, SavageBio_ActToCentre, SavageBio_StateRetractStart, SavageBio_ActFrame4FB, SavageBio_ActDie
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script1:
	jmp	$1FFA(a5)	; -> SavageBio_ActCrossIfUp
loc_0B7E32:
	jmp	$1FD2(a5)	; -> SavageBio_ActFrame4F
loc_0B7E36:
	jmp	$2002(a5)	; -> SavageBio_ActToCentre
loc_0B7E3A:
	jmp	$1F5A(a5)	; -> SavageBio_StateRetractStart
loc_0B7E3E:
	jmp	$1FDA(a5)	; -> SavageBio_ActFrame4FB
loc_0B7E42:
	jmp	$200A(a5)	; -> SavageBio_ActDie
