; ---------------------------------------------------------------------------
; BabyBio_ActDropFlame - BABYBIO script action: kill the attached BIOFLAME, next entry
; In:  8(a6) = this
; Out: none
; Evidence: +$A8 vtable +$52 Kill
; ---------------------------------------------------------------------------
BabyBio_ActDropFlame:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A8(a4)
	beq.s	loc_11D516
	movea.l	$A8(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11D516:
	tst.l	$98(a4)
	bne.s	loc_11D528
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D554
loc_11D528:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D53C
	clr.w	$96(a4)
loc_11D53C:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11D554:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
