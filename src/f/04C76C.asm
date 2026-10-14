; ---------------------------------------------------------------------------
; sub_04C76C	[jt 349]
; ---------------------------------------------------------------------------
sub_04C76C:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a0
	movea.l	$92(a0),a4
	lea.l	$2E(a0),a3
	cmpi.w	#$FF,d7
	bne.s	loc_04C79A
	move.b	#$FF,$1(a4)
	move.b	#$FF,$1(a3)
	bra.w	loc_04C828
loc_04C79A:
	cmpi.w	#$80,d7
	blt.s	loc_04C804
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.w	$8C(a0),d0
	moveq	#$20,d1
	and.w	d0,d1
	bne.s	loc_04C7C8
	cmpi.w	#$81,d7
	beq.s	loc_04C7C2
	cmpi.w	#$82,d7
	beq.s	loc_04C7C2
	cmpi.w	#$83,d7
	bne.s	loc_04C7C8
loc_04C7C2:
	andi.b	#$FB,(a4)
	bra.s	loc_04C7CC
loc_04C7C8:
	ori.b	#$4,(a4)
loc_04C7CC:
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_04C7EE
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_04C7EE
	ori.b	#$20,(a4)
	bra.s	loc_04C7FC
loc_04C7EE:
	andi.b	#$DF,(a4)
	movea.l	$8(a6),a0
	ori.w	#$8,$4(a0)
loc_04C7FC:
	move.b	#$FF,$1(a3)
	bra.s	loc_04C828
loc_04C804:
	ori.b	#$4,(a4)
	clr.b	$1(a4)
	moveq	#$0,d0
	move.b	$A(a4),d0
	tst.l	d0
	bne.s	loc_04C81C
	ori.b	#$20,(a4)
	bra.s	loc_04C820
loc_04C81C:
	andi.b	#$DF,(a4)
loc_04C820:
	move.b	d7,$1(a3)
	ori.b	#$4,(a3)
loc_04C828:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
