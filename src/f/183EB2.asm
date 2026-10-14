; ---------------------------------------------------------------------------
; sub_183EB2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_183EB2:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	-$1758(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_183ED2
	lea.l	-$1848(a5),a0
	move.l	a0,d0
	bra.s	loc_183ED8
loc_183ED2:
	lea.l	-$1758(a5),a0
	move.l	a0,d0
loc_183ED8:
	movea.l	d0,a3
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d7
	moveq	#$64,d0
	sub.l	d0,d7
	tst.l	$44(a4)
	bne.s	loc_183F00
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_183F66
loc_183F00:
	tst.w	$6E(a4)
	bgt.s	loc_183F16
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	bra.s	loc_183F66
loc_183F16:
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_183F66
	cmp.w	$4E(a3),d6
	blt.s	loc_183F66
	cmp.w	$52(a3),d6
	bgt.s	loc_183F66
	cmp.w	$4C(a3),d7
	blt.s	loc_183F66
	cmp.w	$50(a3),d7
	bgt.s	loc_183F66
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_183F66:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
