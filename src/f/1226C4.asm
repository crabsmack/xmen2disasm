; ---------------------------------------------------------------------------
; BigBio_StateFlyToTarget - BIGBIO: fly toward the target (+$A4/+$A8) with the orbs spinning, braking near it; then next entry
; In:  8(a6) = this
; Out: d0
; Evidence: BigBio_UpdateOrbRing; timer +$6E
; ---------------------------------------------------------------------------
BigBio_StateFlyToTarget:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$A4(a4),d6
	sub.l	$8(a4),d6
	move.l	$A8(a4),d7
	sub.l	$C(a4),d7
	tst.l	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_1226EC
	move.l	d6,d0
	bra.s	loc_1226F0
loc_1226EC:
	move.l	d6,d0
	neg.l	d0
loc_1226F0:
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1226FC
	move.l	d7,d1
	bra.s	loc_122700
loc_1226FC:
	move.l	d7,d1
	neg.l	d1
loc_122700:
	move.l	d1,d5
	add.l	d0,d5
	move.l	a4,-(a7)
	jsr	BigBio_UpdateOrbRing(pc)
	cmpi.l	#$500,d5
	addq.w	#$4,a7
	bge.s	loc_12273E
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	asr.l	#$4,d0
	move.w	d0,$1E(a4)
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
	asr.l	#$4,d0
	move.w	d0,$20(a4)
	moveq	#$5,d0
	cmp.w	$6E(a4),d0
	bge.s	loc_12273E
	move.w	#$2,$6E(a4)
loc_12273E:
	cmpi.l	#$100,d5
	ble.s	loc_122760
	tst.w	$6E(a4)
	beq.s	loc_122760
	clr.w	$6C(a4)
	lea.l	BigBio_StateFlyToTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1227AA
loc_122760:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	bne.s	loc_12277E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_1227AA
loc_12277E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_122792
	clr.w	$96(a4)
loc_122792:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_1227AA:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
