; ---------------------------------------------------------------------------
; SentinelDoor_ClassInit - empty: returns at once (this class's override of: per-level class setup for SENTINELDOOR)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the SENTINELDOOR descriptor $0DE9A0; TAS frames 2515-5209 (2 frames active)
; ---------------------------------------------------------------------------
SentinelDoor_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
