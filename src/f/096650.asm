; ---------------------------------------------------------------------------
; XClone_ActStand60B - XCLONE script action: stand still for $3C frames (second copy of XClone_ActStand60)
; In:  8(a6) = this
; Out: none
; Evidence: byte-for-byte the same body as XClone_ActStand60; jt 735; never runs in the corpus
; Found: jt 735
; ---------------------------------------------------------------------------
XClone_ActStand60B:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_09668E
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0966BC
loc_09668E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0966A2
	clr.w	$96(a4)
loc_0966A2:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0966BC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
