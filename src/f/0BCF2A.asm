; ---------------------------------------------------------------------------
; SavageMediumBio_StateWalk - SAVAGEMEDIUMBIO state: walk until the timer +$6E runs out, then the next step
; In:  8(a6) = this
; Out: none
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageMediumBio_StateWalk:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0BCF7A
	tst.l	$98(a4)
	bne.s	loc_0BCF4C
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BCF8C
loc_0BCF4C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BCF60
	clr.w	$96(a4)
loc_0BCF60:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BCF8C
loc_0BCF7A:
	clr.w	$6C(a4)
	lea.l	SavageMediumBio_StateWalk(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BCF8C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
