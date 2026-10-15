; ---------------------------------------------------------------------------
; SavageBio_Script1 - AI-script jmp thunks (6 steps): sub_0BC8AC, sub_0BC4A0, sub_0BC920, SavageBio_StateRetractStart, sub_0BC516, sub_0BCA7E
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script1:
	jmp	$1FFA(a5)	; -> sub_0BC8AC
loc_0B7E32:
	jmp	$1FD2(a5)	; -> sub_0BC4A0
loc_0B7E36:
	jmp	$2002(a5)	; -> sub_0BC920
loc_0B7E3A:
	jmp	$1F5A(a5)	; -> SavageBio_StateRetractStart
loc_0B7E3E:
	jmp	$1FDA(a5)	; -> sub_0BC516
loc_0B7E42:
	jmp	$200A(a5)	; -> sub_0BCA7E
