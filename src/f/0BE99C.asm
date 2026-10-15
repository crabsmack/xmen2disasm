; ---------------------------------------------------------------------------
; Launcher_Nop6A - vtable +$6A: empty hook for LAUNCHER
; In:  8(a6) = this
; Out: none
; Evidence: slot +$6A of the LAUNCHER descriptor $0BED0C; TAS frames 27879-29685 (2 frames active)
; ---------------------------------------------------------------------------
Launcher_Nop6A:
	link.w	a6,#$0
	unlk	a6
	rts
