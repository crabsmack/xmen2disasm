; ---------------------------------------------------------------------------
; sub_095DDC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_095DDC:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$9C(a4)
	addq.w	#$8,a7
	beq.s	loc_095E0A
	movea.l	$9C(a4),a3
	bra.s	loc_095E34
loc_095E0A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$33F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	lea.l	$14(a7),a7
loc_095E34:
	move.l	a3,d0
	beq.s	loc_095EAE
	ori.w	#$2,$6(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$84(a4)
	move.l	$8(a4),$8(a3)
	move.w	$A4(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,$C(a3)
	move.l	a3,-(a7)
	jsr	$33B2(a5)	; -> sub_11F538
	clr.b	$96(a3)
	lea.l	$333A(a5),a0
	move.l	a0,$5C(a3)
	move.w	#$FF,$6C(a3)
	clr.w	$1E(a3)
	clr.l	$16(a3)
	clr.w	$20(a3)
	move.w	#$100,$18(a3)
	move.w	#$80,$20(a3)
	move.l	a3,$9C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_095ECA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_095EC0
loc_095EAE:
	clr.w	$6C(a4)
	lea.l	sub_096270(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_095EC0:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
