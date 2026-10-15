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
	jmp	$1F2A(a5)	; -> SavageBio_ActFireRocket
	jmp	$1FB2(a5)	; -> SavageBio_ActStop60
	jmp	$1FB2(a5)	; -> SavageBio_ActStop60
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
	jmp	$1F72(a5)	; -> SavageBio_ActAnimB
	jmp	$1F9A(a5)	; -> SavageBio_ActDashPast
	jmp	$1FB2(a5)	; -> SavageBio_ActStop60
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1F2A(a5)	; -> SavageBio_ActFireRocket
	jmp	$1FB2(a5)	; -> SavageBio_ActStop60
	jmp	$1F72(a5)	; -> SavageBio_ActAnimB
	jmp	$1F92(a5)	; -> SavageBio_ActChargePlayer
	jmp	$1F5A(a5)	; -> SavageBio_StateRetractStart
	jmp	$1F42(a5)	; -> SavageBio_ActReloadArt10
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
	jmp	$1F5A(a5)	; -> SavageBio_StateRetractStart
	jmp	$1F52(a5)	; -> SavageBio_ActExtendTentacle2
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
	jmp	$1F4A(a5)	; -> SavageBio_ActExtendTentacle
	jmp	$1FBA(a5)	; -> SavageBio_ActStop30
	jmp	$1FDA(a5)	; -> SavageBio_ActFrame4FB
	jmp	$1FE2(a5)	; -> SavageBio_StateCrossSurface
	jmp	$1FD2(a5)	; -> SavageBio_ActFrame4F
	jmp	$1F3A(a5)	; -> SavageBio_ActReloadArt14
	jmp	$1F7A(a5)	; -> SavageBio_ActAnimC
	jmp	$1FA2(a5)	; -> SavageBio_ActDashTo
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FC2(a5)	; -> SavageBio_ActWait30
	jmp	$1FA2(a5)	; -> SavageBio_ActDashTo
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F8A(a5)	; -> SavageBio_ActChargeGo
	jmp	$1FCA(a5)	; -> SavageBio_ActWait5
	jmp	$1F32(a5)	; -> SavageBio_ActFireVertical
	jmp	$1F42(a5)	; -> SavageBio_ActReloadArt10
	jmp	$1F6A(a5)	; -> SavageBio_ActAnimA
	jmp	$1F82(a5)	; -> SavageBio_ActCharge
	jmp	$1F22(a5)	; -> SavageBio_ActFacePlayer
	jmp	$1FDA(a5)	; -> SavageBio_ActFrame4FB
	jmp	$1FE2(a5)	; -> SavageBio_StateCrossSurface
	jmp	$1FD2(a5)	; -> SavageBio_ActFrame4F
	jmp	$1FAA(a5)	; -> SavageBio_ActFrame40
