; ---------------------------------------------------------------------------
; BioSentinel_Nop6A - BioSentinel: no-op override of virtual slot 25 (+$6A)
; In:  none (unused)
; Out: none
; Evidence: method 25 of class descriptor $1235F6 (name string "BIOSENTINEL", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BioSentinel_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
