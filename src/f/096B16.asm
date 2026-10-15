; ---------------------------------------------------------------------------
; XClone_ActWaitChildFlag - XCLONE script action: wait until the child's +$98 bit $200 is clear, then the next step
; In:  8(a6) = this
; Out: d0
; Evidence: jt 744
; Found: jt 744
; ---------------------------------------------------------------------------
XClone_ActWaitChildFlag:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	beq.s	loc_096B48
	move.w	#$200,d0
	and.w	$98(a3),d0
	beq.s	loc_096B48
	clr.w	$6C(a4)
	lea.l	XClone_ActWaitChildFlag(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_096B86
loc_096B48:
	tst.l	$98(a4)
	bne.s	loc_096B5A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_096B86
loc_096B5A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_096B6E
	clr.w	$96(a4)
loc_096B6E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_096B86:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
