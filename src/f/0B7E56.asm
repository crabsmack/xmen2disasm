; ---------------------------------------------------------------------------
; SavageBio_Script3 - AI-script jmp thunks (11 steps): SavageBio_ActExtendShort, SavageBio_ActStop30, SavageBio_ActFacePlayer, SavageBio_ActStop30, SavageBio_ActAnimB, SavageBio_ActDashPast, SavageBio_ActStop60, SavageBio_ActFacePlayer, SavageBio_StateRetractStart, SavageBio_ActReloadArt14, SavageBio_ActExtendShort
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
SavageBio_Script3:
	jmp	$1F62(a5)	; -> SavageBio_ActExtendShort
loc_0B7E5A:
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
loc_0B7E5E:
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
loc_0B7E62:
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
loc_0B7E66:
	jmp	$1F72(a5)	; -> SavageBio_ActAnimB
loc_0B7E6A:
	jmp	$1F9A(a5)	; -> SavageBio_ActDashPast
loc_0B7E6E:
	jmp	$1FB2(a5)	; -> SavageBio_ActStop60
loc_0B7E72:
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
loc_0B7E76:
	jmp	$1F5A(a5)	; -> SavageBio_StateRetractStart
loc_0B7E7A:
	jmp	$1F3A(a5)	; -> SavageBio_ActReloadArt14
loc_0B7E7E:
	jmp	$1F62(a5)	; -> SavageBio_ActExtendShort
