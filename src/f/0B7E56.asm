; ---------------------------------------------------------------------------
; SavageBio_Script3 - AI-script jmp thunks (11 steps): sub_0BB71E, sub_0BC398, sub_0BAF14, sub_0BC398, sub_0BB850, sub_0BBE0C, sub_0BC338, sub_0BAF14, sub_0BB698, sub_0BB38C, sub_0BB71E
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script3:
	jmp	$1F62(a5)	; -> sub_0BB71E
loc_0B7E5A:
	jmp	$1FBA(a5)	; -> sub_0BC398
loc_0B7E5E:
	jmp	$1F22(a5)	; -> sub_0BAF14
loc_0B7E62:
	jmp	$1FBA(a5)	; -> sub_0BC398
loc_0B7E66:
	jmp	$1F72(a5)	; -> sub_0BB850
loc_0B7E6A:
	jmp	$1F9A(a5)	; -> sub_0BBE0C
loc_0B7E6E:
	jmp	$1FB2(a5)	; -> sub_0BC338
loc_0B7E72:
	jmp	$1F22(a5)	; -> sub_0BAF14
loc_0B7E76:
	jmp	$1F5A(a5)	; -> sub_0BB698
loc_0B7E7A:
	jmp	$1F3A(a5)	; -> sub_0BB38C
loc_0B7E7E:
	jmp	$1F62(a5)	; -> sub_0BB71E
