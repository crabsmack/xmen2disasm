; ---------------------------------------------------------------------------
; BabySentinelB_Hook66 - BabySentinelB: virtual hook at class slot 24 (+$66); no caller found yet
; In:  8(a6) = this
; Out: none
; Evidence: method 24 of class descriptor $11B866 (name string "BABYSENTINELB", parent BABYBIO)
; ---------------------------------------------------------------------------
BabySentinelB_Hook66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
