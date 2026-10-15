; ---------------------------------------------------------------------------
; BabyBio_Nop6A - BabyBio: no-op override of virtual slot 25 (+$6A)
; In:  none (unused)
; Out: none
; Evidence: method 25 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
