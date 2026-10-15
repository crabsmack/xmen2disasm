; ---------------------------------------------------------------------------
; TechWallGun_SetupBurst - prepare a burst: firing animation, state to return to, shot direction, shot count
; In:  8(a6) = this, $C(a6) = animation, $10(a6) = return state, $14(a6) = word direction
; Out: none
; Evidence: +$94 anim, +$90 return state, +$A4 direction, +$A2 = +$A0 shots
; ---------------------------------------------------------------------------
TechWallGun_SetupBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),$94(a4)
	move.w	$16(a6),$A4(a4)
	move.l	$10(a6),$90(a4)
	move.w	$A0(a4),$A2(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
