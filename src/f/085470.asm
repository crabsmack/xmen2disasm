; ---------------------------------------------------------------------------
; Teleporter_ClassInit - empty: returns at once (this class's override of: per-level class setup for TELEPORTER)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the TELEPORTER descriptor $085380; TAS frames 47905-47905 (1 frames active)
; ---------------------------------------------------------------------------
Teleporter_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
