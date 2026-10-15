; ---------------------------------------------------------------------------
; SmallBrood_StateLanded - SMALLBROOD state: landed - frame 0, run the next AI-script step
; In:  8(a6) = this
; Out: none
; Evidence: SetFrame(0) then the next-step idiom
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateLanded:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_084EB6
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_084EE2
loc_084EB6:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_084ECA
	clr.w	$96(a4)
loc_084ECA:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_084EE2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
