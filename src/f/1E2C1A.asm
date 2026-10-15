; ---------------------------------------------------------------------------
; Cyclops_AirAttackDown - CYCLOPS slot +$BE: Down+B in the air: same as his B air attack (+$C2)
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = own +$C2 (Cyclops_AirAttack) and runs it
; ---------------------------------------------------------------------------
Cyclops_AirAttackDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	(a4),a0
	move.l	$C2(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$C2(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
