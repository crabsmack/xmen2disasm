; ---------------------------------------------------------------------------
; Tower_ClassInit - vtable +$5E: per-level class setup for TOWER (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor TOWER slot +$5E (tools/classes.py); TAS frames 10316-11770 (2 active)
; ---------------------------------------------------------------------------
Tower_ClassInit:
	link.w	a6,#$0
	jsr	sub_01ABBC(pc)
	unlk	a6
	rts
