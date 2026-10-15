; ---------------------------------------------------------------------------
; ControlPanel_SetFlags - CONTROLPANEL slot +$6E: set bits in its flag word (+$8C)
; In:  8(a6) = this, $E(a6) = word bits
; Out: none
; Evidence: TAS 2750-6912
; Found: jt 1193
; ---------------------------------------------------------------------------
ControlPanel_SetFlags:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	movea.l	$8C(a0),a4
	move.w	$E(a6),d0
	or.w	d0,(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
