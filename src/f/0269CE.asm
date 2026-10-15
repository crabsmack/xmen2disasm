; ---------------------------------------------------------------------------
; RetractFloor_Nop66 - vtable +$66: empty (loads `this` and returns)
; In:  8(a6) = this (RETRACTFLOOR object)
; Out: none
; Evidence: class descriptor RETRACTFLOOR slot +$66 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
RetractFloor_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
