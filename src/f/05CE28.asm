; ---------------------------------------------------------------------------
; Tusk_Nop66 - vtable +$66: empty (loads `this` and returns)
; In:  8(a6) = this (TUSK object)
; Out: none
; Evidence: class descriptor TUSK slot +$66 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
Tusk_Nop66:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
