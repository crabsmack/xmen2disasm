; ---------------------------------------------------------------------------
; SavageBio_Script4 - AI-script jmp thunks (4 steps): sub_11F11C, sub_0BD1D8, sub_11F152, sub_0BD216
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script4:
	jmp	$336A(a5)	; -> sub_11F11C
loc_0B8150:
	jmp	$205A(a5)	; -> sub_0BD1D8
loc_0B8154:
	jmp	$3372(a5)	; -> sub_11F152
loc_0B8158:
	jmp	$2062(a5)	; -> sub_0BD216
