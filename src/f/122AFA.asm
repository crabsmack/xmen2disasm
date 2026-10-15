; ---------------------------------------------------------------------------
; BigBio_StateSpinUp - BIGBIO: spin the orb ring up, alternating short and long holds, then next entry
; In:  8(a6) = this
; Out: d0
; Evidence: byte +$B7 toggles 1/2
; ---------------------------------------------------------------------------
BigBio_StateSpinUp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	BigBio_UpdateOrbRing(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_122B50
	tst.l	$98(a4)
	bne.s	loc_122B22
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122B8E
loc_122B22:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_122B36
	clr.w	$96(a4)
loc_122B36:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_122B8E
loc_122B50:
	tst.w	$6E(a4)
	bne.s	loc_122B7C
	moveq	#$0,d0
	move.b	$B7(a4),d0
	cmpi.w	#$1,d0
	beq.s	loc_122B70
	move.b	#$1,$B7(a4)
	move.w	#$12,$6E(a4)
	bra.s	loc_122B7C
loc_122B70:
	move.b	#$2,$B7(a4)
	move.w	#$C8,$6E(a4)
loc_122B7C:
	clr.w	$6C(a4)
	lea.l	BigBio_StateSpinUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_122B8E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
