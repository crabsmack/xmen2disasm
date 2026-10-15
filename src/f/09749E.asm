; ---------------------------------------------------------------------------
; sub_09749E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09749E:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> sub_11F188
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0974F8
	lea.l	$42AA(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	lea.l	$33E2(a5),a0
	move.l	a0,$A2(a3)
	move.w	$AA(a3),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$AA(a3)
	lea.l	$335A(a5),a0
	move.l	a0,$5C(a3)
	clr.w	$6C(a3)
	clr.w	$6C(a4)
	lea.l	sub_097426(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_09750A
loc_0974F8:
	clr.w	$6C(a4)
	lea.l	sub_09749E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_09750A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
