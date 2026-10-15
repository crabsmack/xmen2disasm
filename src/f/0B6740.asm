; ---------------------------------------------------------------------------
; BrainBabyBio_GetSize - vtable +$06: return sizeof(BRAINBABYBIO) = $C0 bytes
; In:  none
; Out: d0 = $C0
; Evidence: slot +$6 of the BRAINBABYBIO descriptor $0B7B1C; never runs in the corpus
; ---------------------------------------------------------------------------
BrainBabyBio_GetSize:
	link.w	a6,#$0
	move.l	#$C0,d0
	unlk	a6
	rts
