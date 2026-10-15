; ---------------------------------------------------------------------------
; SavageBio_Script5 - AI-script jmp thunks (5 steps): BioBalls_ActClearDone, BioBalls_StateAnimA, sub_0BC80C, BioBalls_ActSetDone, BioBalls_StateIdle
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script5:
	jmp	$3342(a5)	; -> BioBalls_ActClearDone
loc_0B817C:
	jmp	$336A(a5)	; -> BioBalls_StateAnimA
loc_0B8180:
	jmp	$1FF2(a5)	; -> sub_0BC80C
loc_0B8184:
	jmp	$334A(a5)	; -> BioBalls_ActSetDone
loc_0B8188:
	jmp	$333A(a5)	; -> BioBalls_StateIdle
