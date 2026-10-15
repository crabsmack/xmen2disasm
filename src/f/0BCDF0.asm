; ---------------------------------------------------------------------------
; SavageMediumBio_SetHome - SAVAGEMEDIUMBIO: set its home position (+$AE/+$B0)
; In:  8(a6) = this, $E(a6) = word x, $12(a6) = word y
; Out: none
; Evidence: caller BrainBabyBio_OnDeath ($18E, $140); TAS 33558
; Found: jt 1027
; ---------------------------------------------------------------------------
SavageMediumBio_SetHome:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),$AE(a4)
	move.w	$12(a6),$B0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
