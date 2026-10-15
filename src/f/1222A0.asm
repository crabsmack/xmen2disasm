; ---------------------------------------------------------------------------
; BigBio_StateSpitFire - BIGBIO: spit frame, launch a projectile; after the shot count (+$B4) next entry, else frame B
; In:  8(a6) = this
; Out: d0
; Evidence: BigBio_SpitSpawn; TAS 36842-36850
; ---------------------------------------------------------------------------
BigBio_StateSpitFire:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($86).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	BigBio_SpitSpawn(pc)
	subq.w	#$1,$B4(a4)
	tst.w	$B4(a4)
	lea.l	$10(a7),a7
	bgt.s	loc_122310
	tst.l	$98(a4)
	bne.s	loc_1222E2
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122324
loc_1222E2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_1222F6
	clr.w	$96(a4)
loc_1222F6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122324
loc_122310:
	move.w	#$1,$6C(a4)
	lea.l	BigBio_StateSpitBetween(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_122324:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
