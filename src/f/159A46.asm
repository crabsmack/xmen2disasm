; ---------------------------------------------------------------------------
; sub_159A46	[jt 1991]
; ---------------------------------------------------------------------------
sub_159A46:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	sub_1599CC(pc)
	move.l	d0,$2(a4)
	cmp.l	-$4(a6),d0
	beq.s	loc_159A7C
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_159A7C:
	ext.l	d7
	move.l	d7,-(a7)
	jsr	sub_159A06(pc)
	move.w	d0,d7
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_159AA0
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_159AA0
	ori.b	#$20,(a4)
	bra.s	loc_159AAA
loc_159AA0:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_159AAA:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
