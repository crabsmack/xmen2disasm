; ---------------------------------------------------------------------------
; Ninja_ActIdleAnim - NINJA script action: idle animation, next step at once
; In:  8(a6) = this
; Out: none
; Evidence: Obj_ChangeAnim(Tbl_NinjaAnimIdle), next step, +$6C = 0
; ---------------------------------------------------------------------------
Ninja_ActIdleAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3A7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D6E2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_13D70E
loc_13D6E2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D6F6
	clr.w	$96(a4)
loc_13D6F6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_13D70E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
