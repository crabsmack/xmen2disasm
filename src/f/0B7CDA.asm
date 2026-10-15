; ---------------------------------------------------------------------------
; BrainBabyBio_Script - AI-script jmp thunks (3 steps): BabyBio_ActPlayAnimC, BabyBio_ActFacePlayer, BabyBio_ActStartFiring
; Evidence: 4-byte `jmp d(a5)` entries of a {word count; thunks} script, reached through +$5C (next-step idiom)
; Found: runtime: executed in 1 run(s) (tas)
; ---------------------------------------------------------------------------
BrainBabyBio_Script:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_0B7CDE:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_0B7CE2:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
