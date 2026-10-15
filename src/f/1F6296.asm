; ---------------------------------------------------------------------------
; Obj_ChangeAnim - switch an object to an animation script unless it is already playing it
; In:  8(a6) = object   $C(a6) = animation script pointer
; Out: none
; Evidence: Obj_SetAnim only when script != +$44; 116 callers
; ---------------------------------------------------------------------------
Obj_ChangeAnim:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	cmpa.l	$44(a4),a3
	beq.s	loc_1F62B6
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	Obj_SetAnim(pc)
	addq.w	#$8,a7
loc_1F62B6:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
