; ---------------------------------------------------------------------------
; Barbarian_StateAttack0 - BARBARIAN attack 0: animation jt[$22A2] to its end
; In:  8(a6) = this
; Out: d0
; Evidence: next Barbarian_StateAttackEnd
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateAttack0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$20A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Barbarian_StateAttackEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
