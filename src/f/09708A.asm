; ---------------------------------------------------------------------------
; XClone_StateChildLeap - XCLONE state: move the child until it reaches the floor, then stop it and make the impact
; In:  8(a6) = this
; Out: d0
; Evidence: clears child flag $400, XClone_Impact(x, y); next XClone_StateChildReturn
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StateChildLeap:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$9C(a3),a4
	move.w	$A6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bge.s	loc_0970F0
	move.w	$A6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	andi.w	#$FBFF,$98(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	XClone_Impact(pc)
	addq.w	#$8,a7
	clr.w	$6C(a3)
	lea.l	XClone_StateChildReturn(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_097150
loc_0970F0:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	tst.b	-$38DE(a5)
	beq.s	loc_09713E
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
loc_09713E:
	clr.w	$6C(a3)
	lea.l	XClone_StateChildLeap(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_097150:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
