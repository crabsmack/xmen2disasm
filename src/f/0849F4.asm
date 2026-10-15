; ---------------------------------------------------------------------------
; SmallBrood_ActWalk - SMALLBROOD script action: walk in the facing direction (state SmallBrood_StateApproach)
; In:  8(a6) = this
; Out: d0
; Evidence: vx = +-(+$A6) by h-flip, walk animation; jt 591; TAS 53624-57116
; Found: jt 591
; ---------------------------------------------------------------------------
SmallBrood_ActWalk:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_084A14
	move.w	$A6(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
	bra.s	loc_084A1A
loc_084A14:
	move.w	$A6(a4),$16(a4)
loc_084A1A:
	lea.l	$11EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateApproach(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
