; ---------------------------------------------------------------------------
; Cyclops_EndBeam - switch the optic beam off: clear beam active, beam record and sprite, the meter-full flag, attack strength back to 2
; In:  8(a6) = player
; Out: none
; Evidence: +$E0 = 0, +$D8 = 0 (cut length), +$BC bit 5 cleared, word +$A6 = 0, +$BE = 0, +$D0 = 0, +$90 &= ~$800, +$44 = 0, +$70 = 2; 7 callers (beam states, TakeDamage, scene end)
; ---------------------------------------------------------------------------
Cyclops_EndBeam:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$E0(a4)
	clr.l	$D8(a4)
	andi.b	#$DF,$BC(a4)
	clr.w	$A6(a4)
	moveq	#$0,d0
	move.l	d0,$BE(a4)
	move.l	d0,$D0(a4)
	andi.l	#$FFFFF7FF,$90(a4)
	move.l	d0,$44(a4)
	move.b	#$2,$70(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
