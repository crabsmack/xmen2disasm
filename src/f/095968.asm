; ---------------------------------------------------------------------------
; XClone_StateWaitChild - XCLONE state: wait until the child object (+$9C) reports done (BioBalls_IsDone), then the next script step
; In:  8(a6) = this
; Out: none
; Evidence: 5 callers (actions that start a child effect); TAS 52268-56717
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateWaitChild:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_09599A
	move.l	$9C(a4),-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_09599A
	clr.w	$6C(a4)
	lea.l	XClone_StateWaitChild(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0959D8
loc_09599A:
	tst.l	$98(a4)
	bne.s	loc_0959AC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0959D8
loc_0959AC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0959C0
	clr.w	$96(a4)
loc_0959C0:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0959D8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
