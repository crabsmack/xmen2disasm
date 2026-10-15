; ---------------------------------------------------------------------------
; Platform1_Hook66 - Platform1: virtual hook at class slot 24 (+$66); no caller found yet
; In:  8(a6) = this
; Out: none
; Evidence: method 24 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_Hook66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
