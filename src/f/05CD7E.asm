; ---------------------------------------------------------------------------
; Tusk_ClassInit - empty: returns at once (this class's override of: per-level class setup for TUSK (load its resources))
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor TUSK slot +$5E (tools/classes.py); TAS frames 20333-20333 (1 active)
; ---------------------------------------------------------------------------
Tusk_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
