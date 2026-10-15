; ---------------------------------------------------------------------------
; BabyBio_ActWalkUntilPlayerAhead - BABYBIO script action: keep walking until a limit is reached or the nearest player is ahead within 128 px, then next entry
; In:  8(a6) = this
; Out: d0
; Evidence: Player_Nearest, facing bit +$2E; TAS 45429-57404
; ---------------------------------------------------------------------------
BabyBio_ActWalkUntilPlayerAhead:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	cmp.w	$AC(a4),d7
	addq.w	#$4,a7
	beq.s	loc_11D010
	cmp.w	$AE(a4),d7
	bne.s	loc_11D02C
loc_11D010:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.w	loc_11D0CA
loc_11D02C:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D042
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	slt.b	d0
	neg.b	d0
	bra.s	loc_11D04E
loc_11D042:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	sgt.b	d0
	neg.b	d0
loc_11D04E:
	beq.s	loc_11D0B8
	move.l	$9C(a4),d0
	sub.l	$8(a3),d0
	move.l	d0,d7
	asr.l	#$8,d7
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11D06A
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11D070
loc_11D06A:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11D070:
	move.w	d0,d7
	cmpi.w	#$80,d7
	bge.s	loc_11D0B8
	tst.l	$98(a4)
	bne.s	loc_11D08A
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D0CA
loc_11D08A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D09E
	clr.w	$96(a4)
loc_11D09E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11D0CA
loc_11D0B8:
	clr.w	$6C(a4)
	lea.l	BabyBio_ActWalkUntilPlayerAhead(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11D0CA:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
