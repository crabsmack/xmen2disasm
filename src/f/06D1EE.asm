; ---------------------------------------------------------------------------
; Brood_ClassInit - empty: returns at once (this class's override of: per-level class setup for BROOD (load its resources))
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor BROOD slot +$5E (tools/classes.py); TAS frames 45407-47903 (2 active)
; ---------------------------------------------------------------------------
Brood_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
