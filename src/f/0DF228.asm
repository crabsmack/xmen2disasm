; ---------------------------------------------------------------------------
; SentinelElevator_ClassInit - vtable +$5E: per-level class setup for SENTINELELEVATOR
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SENTINELELEVATOR descriptor $0DF556; TAS frames 2515-9714 (3 frames active)
; ---------------------------------------------------------------------------
SentinelElevator_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
