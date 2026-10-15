; ---------------------------------------------------------------------------
; Barbarian_StateTaunt_Play - Barbarian_StateTaunt case: play the taunt animation
; Evidence: switch target
; Found: runtime: executed in 64 run(s) (fuzz-01800-s1...)
; ---------------------------------------------------------------------------
Barbarian_StateTaunt_Play:
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	Barbarian_StateTaunt_Wait
loc_0BDC5C:
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	bra.s	Barbarian_StateTaunt_Wait
loc_0BDC6E:
	lea.l	$2092(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
