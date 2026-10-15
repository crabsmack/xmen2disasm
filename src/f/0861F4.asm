; ---------------------------------------------------------------------------
; BroodBossArm_GetSize - vtable +$06: return sizeof(BROODBOSSARM) = $90 bytes
; In:  none
; Out: d0 = $90
; Evidence: slot +$6 of the BROODBOSSARM descriptor $088C74; never runs in the corpus
; ---------------------------------------------------------------------------
BroodBossArm_GetSize:
	link.w	a6,#$0
	move.l	#$90,d0
	unlk	a6
	rts
