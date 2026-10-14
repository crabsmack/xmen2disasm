; ---------------------------------------------------------------------------
; sub_182DC2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_182DC2:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_182DE2
	move.w	-$3BA4(a5),d0
	and.w	-$3A26(a5),d0
	bra.s	loc_182DEA
loc_182DE2:
	move.w	-$3BA4(a5),d0
	and.w	-$3A28(a5),d0
loc_182DEA:
	beq.s	loc_182E60
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	#$10000,d0
	and.l	$90(a4),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_182E18
	move.l	#$FFFFF7CC,d0
	bra.s	loc_182E1A
loc_182E18:
	moveq	#$0,d0
loc_182E1A:
	move.w	d0,$18(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$E(a0),$20(a4)
	clr.b	-$3892(a5)
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	moveq	#$0,d1
	or.w	d0,d1
	move.w	d1,$C0(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_182F02
loc_182E60:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_182E74
	move.w	-$3BA6(a5),d0
	and.w	-$3A2E(a5),d0
	bra.s	loc_182E7C
loc_182E74:
	move.w	-$3BA6(a5),d0
	and.w	-$3A30(a5),d0
loc_182E7C:
	beq.s	loc_182EF0
	tst.b	$9D(a4)
	bne.s	loc_182E94
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_182EA2
loc_182E94:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_182EA2:
	movea.l	$8C(a4),a0
	move.b	$4(a0),$70(a4)
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$2C(a0),d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$426A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_182DC2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_182F02
loc_182EF0:
	clr.w	$6C(a4)
	lea.l	sub_182DC2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_182F02:
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
