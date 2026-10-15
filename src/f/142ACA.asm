; ---------------------------------------------------------------------------
; TechWallGun_Nop66 - TECHWALLGUN slot +$66: no-op
; In:  8(a6) = this
; Out: none
; Evidence: 6-instruction no-op
; ---------------------------------------------------------------------------
TechWallGun_Nop66:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
