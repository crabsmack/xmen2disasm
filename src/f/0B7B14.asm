; ---------------------------------------------------------------------------
; SavageA4_NopStatic - empty non-virtual helper (called from BrainBabyBio_Init and BrainChild_ClassInit)
; Out: none
; Evidence: TAS 33387-33537
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_NopStatic:
	link.w	a6,#$0
	unlk	a6
	rts
