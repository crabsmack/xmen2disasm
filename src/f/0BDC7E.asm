; ---------------------------------------------------------------------------
; Barbarian_StateTaunt_Wait - tail of Barbarian_StateTaunt: wait for the animation, then idle
; Evidence: switch exit
; ---------------------------------------------------------------------------
Barbarian_StateTaunt_Wait:
	move.w	#$FF,$6C(a4)
	lea.l	Barbarian_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDC92:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
