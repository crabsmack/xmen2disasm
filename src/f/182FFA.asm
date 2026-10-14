; ---------------------------------------------------------------------------
; sub_182FFA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_182FFA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_18301A
	move.l	a4,-(a7)
	jsr	sub_182F0C(pc)
	addq.w	#$4,a7
	bra.w	loc_1830B6
loc_18301A:
	tst.w	$6E(a4)
	bgt.w	loc_1830A4
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$12(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	tst.b	$9D(a4)
	bne.s	loc_183056
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A2E(a5),d0
	move.w	d0,-$3A2E(a5)
	bra.s	loc_183064
loc_183056:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	-$3A30(a5),d0
	move.w	d0,-$3A30(a5)
loc_183064:
	moveq	#$0,d0
	move.l	d0,$44(a4)
	bclr	#$0,$93(a4)
	ori.l	#$2,$90(a4)
	move.w	#$1000,d1
	and.w	$4(a4),d1
	beq.s	loc_183090
	subi.l	#$F00,$C(a4)
	move.b	#$1,-$3892(a5)
loc_183090:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1830B6
loc_1830A4:
	clr.w	$6C(a4)
	lea.l	sub_182FFA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1830B6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
