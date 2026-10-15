; ---------------------------------------------------------------------------
; XClone_ActMainScript - XCLONE script action: restart the clone's main script (clone record + word 8) from step 0
; In:  8(a6) = this
; Out: none
; Evidence: jt 763; 5 callers
; Found: jt 763
; ---------------------------------------------------------------------------
XClone_ActMainScript:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	tst.l	$98(a4)
	bne.s	loc_097D90
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_097DAC
loc_097D90:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_097DAC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
