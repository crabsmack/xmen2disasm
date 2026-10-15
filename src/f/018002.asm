; ---------------------------------------------------------------------------
; ShootAcolyte_ClassInit - vtable +$5E: per-level class setup for SHOOTACOLYTE (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor SHOOTACOLYTE slot +$5E (tools/classes.py); TAS frames 11770-14117 (2 active)
; ---------------------------------------------------------------------------
ShootAcolyte_ClassInit:
	link.w	a6,#$0
	unlk	a6
	rts
