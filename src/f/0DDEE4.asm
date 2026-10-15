; ---------------------------------------------------------------------------
; ControlPanel_ClassInit - vtable +$5E: per-level class setup for CONTROLPANEL
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the CONTROLPANEL descriptor $0DE48E; TAS frames 2511-5205 (2 frames active)
; ---------------------------------------------------------------------------
ControlPanel_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
