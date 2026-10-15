; ---------------------------------------------------------------------------
; Ninja_ActPause30 - NINJA script action: stop, idle animation and wait 30 frames before the next step
; In:  8(a6) = this
; Out: none
; Evidence: same as Ninja_ActWait with a fixed 30-frame delay; second step of Tbl_NinjaLeaveScript
; ---------------------------------------------------------------------------
Ninja_ActPause30:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$3A7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_13D7C0
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_13D7EE
loc_13D7C0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_13D7D4
	clr.w	$96(a4)
loc_13D7D4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_13D7EE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
