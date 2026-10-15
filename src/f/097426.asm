; ---------------------------------------------------------------------------
; XClone_StateWaitChild2 - XCLONE state: wait until the child reports done (BioBalls_IsDone), then the next step
; In:  8(a6) = this
; Out: d0
; Evidence: like XClone_StateWaitChild without the null-child check; set by XClone_StateBallsReturn
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateWaitChild2:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_097482
	tst.l	$98(a4)
	bne.s	loc_097454
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_097494
loc_097454:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_097468
	clr.w	$96(a4)
loc_097468:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_097494
loc_097482:
	clr.w	$6C(a4)
	lea.l	XClone_StateWaitChild2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_097494:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
