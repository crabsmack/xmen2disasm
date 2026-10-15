; ---------------------------------------------------------------------------
; XClone_PodScript - AI-script jmp thunks (1 steps): sub_11EF96
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
XClone_PodScript:
	jmp	$334A(a5)	; -> sub_11EF96
