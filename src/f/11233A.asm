; ---------------------------------------------------------------------------
; sub_11233A	[jt 1384]
; ---------------------------------------------------------------------------
sub_11233A:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	movea.l	$B0(a3),a4
	lea.l	$2E(a3),a0
	move.l	a0,-$4(a6)
	move.l	a4,d0
	bne.s	loc_112368
	move.b	#$FF,$1(a0)
	clr.b	$B4(a3)
	bra.w	loc_1123F0
loc_112368:
	cmpi.w	#$FF,d7
	bne.s	loc_112384
	move.b	#$FF,$1(a4)
	movea.l	-$4(a6),a0
	move.b	#$FF,$1(a0)
	clr.b	$B4(a3)
	bra.s	loc_1123F0
loc_112384:
	cmpi.w	#$80,d7
	blt.s	loc_1123DE
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	move.b	d7,$1(a4)
	move.b	#$1,$B4(a3)
	moveq	#-$19,d0
	and.b	(a4),d0
	ext.w	d0
	movea.l	-$4(a6),a0
	moveq	#$18,d1
	and.b	(a0),d1
	moveq	#$0,d2
	move.b	d1,d2
	or.w	d0,d2
	move.b	d2,(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1123C8
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1123C8
	ori.b	#$20,(a4)
	bra.s	loc_1123D2
loc_1123C8:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_1123D2:
	movea.l	-$4(a6),a0
	move.b	#$FF,$1(a0)
	bra.s	loc_1123F0
loc_1123DE:
	clr.b	$B4(a3)
	movea.l	-$4(a6),a0
	move.b	d7,$1(a0)
	move.b	#$FF,$1(a4)
loc_1123F0:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
