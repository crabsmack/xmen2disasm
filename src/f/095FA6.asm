; ---------------------------------------------------------------------------
; XClone_StatePodBounce1 - XCLONE entrance: second pod bounce at a quarter speed
; In:  8(a6) = this
; Out: d0
; Evidence: next XClone_StatePodBounce2
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_StatePodBounce1:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$9C(a3),a4
	move.w	$A6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bge.s	loc_095FF4
	move.w	$A6(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	$18(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	clr.w	$6C(a3)
	lea.l	XClone_StatePodBounce2(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.w	loc_096078
loc_095FF4:
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
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_096042
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
loc_096042:
	move.l	$92(a4),d0
	addq.l	#$2,d0
	move.l	d0,-$4(a6)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	movea.l	-$4(a6),a0
	move.w	d0,(a0)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	movea.l	-$4(a6),a0
	move.w	d0,$2(a0)
	clr.w	$6C(a3)
	lea.l	XClone_StatePodBounce1(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_096078:
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
