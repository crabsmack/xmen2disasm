; ---------------------------------------------------------------------------
; XClone_ActWait30 - XCLONE script action: wait $1E frames, next step
; In:  8(a6) = this
; Out: none
; Evidence: jt 737
; Found: jt 737
; ---------------------------------------------------------------------------
XClone_ActWait30:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_096736
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_096764
loc_096736:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_09674A
	clr.w	$96(a4)
loc_09674A:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_096764:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
