; ---------------------------------------------------------------------------
; Barbarian_StateTaunt_Reset - Barbarian_StateTaunt default case: reset the taunt index
; Evidence: switch target
; ---------------------------------------------------------------------------
Barbarian_StateTaunt_Reset:
	clr.b	$BA(a4)
loc_0BDC38:
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	Barbarian_StateTaunt_Wait
