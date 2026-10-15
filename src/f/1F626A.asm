; ---------------------------------------------------------------------------
; Obj_SetAnim - start an animation script on an object from its first step
; In:  8(a6) = object   $C(a6) = animation script pointer
; Out: none
; Evidence: +$44 = script, +$48 (step) = 0, Anim_ApplyStep(obj, 1), flags +4 |= 8; 223 callers (actor state code)
; ---------------------------------------------------------------------------
Obj_SetAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),$44(a4)
	clr.l	$48(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4122(a5)	; -> Anim_ApplyStep
	ori.w	#$8,$4(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
