; ---------------------------------------------------------------------------
; ChildShip_StateDie - CHILDSHIP: death effect (sub_13DCB8(this, $101))
; In:  8(a6) = this
; Out: none
; Evidence: TAS 33550
; Found: link-after-rts
; ---------------------------------------------------------------------------
ChildShip_StateDie:
	link.w	a6,#$0
	pea.l	($101).w
	move.l	$8(a6),-(a7)
	jsr	$3AC2(a5)	; -> sub_13DCB8
	unlk	a6
	rts
