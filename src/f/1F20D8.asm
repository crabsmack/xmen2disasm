; ---------------------------------------------------------------------------
; XPlayer_StateFrozen - frozen state: keep the delay at 255 so no state runs again
; In:  8(a6) = player
; Out: none
; Evidence: +$6C = $FF; installed by XPlayer_FreezeStanding
; ---------------------------------------------------------------------------
XPlayer_StateFrozen:
	link.w	a6,#$0
	movea.l	$8(a6),a0
	move.w	#$FF,$6C(a0)
	unlk	a6
	rts
