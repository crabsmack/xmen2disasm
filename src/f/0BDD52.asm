; ---------------------------------------------------------------------------
; Barbarian_StateWalkStart - BARBARIAN state: start walking (animation jt[$228A], speed +$98) in the facing direction
; In:  8(a6) = this
; Out: d0
; Evidence: next Barbarian_StateWalkRight / Barbarian_StateWalkLeft; TAS 31876-33058
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateWalkStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$208A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	clr.w	$20(a4)
	clr.w	$18(a4)
	andi.w	#$BFFF,$6(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_0BDD9C
	move.w	$98(a4),$16(a4)
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWalkRight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDDBA
loc_0BDD9C:
	move.w	$98(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWalkLeft(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDDBA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
