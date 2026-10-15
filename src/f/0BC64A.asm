; ---------------------------------------------------------------------------
; sub_0BC64A	[jt 1016]
; ---------------------------------------------------------------------------
sub_0BC64A:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$B4(a3),a4
	move.l	a4,d0
	beq.w	loc_0BC6E8
	move.l	$8(a3),$8(a4)
	move.l	$C(a3),$C(a4)
	moveq	#$8,d0
	and.b	$2E(a3),d0
	bne.s	loc_0BC67C
	andi.b	#$F7,$2E(a4)
	bra.s	loc_0BC682
loc_0BC67C:
	ori.b	#$8,$2E(a4)
loc_0BC682:
	moveq	#$10,d0
	and.b	$2E(a3),d0
	bne.s	loc_0BC692
	andi.b	#$EF,$2E(a4)
	bra.s	loc_0BC698
loc_0BC692:
	ori.b	#$10,$2E(a4)
loc_0BC698:
	lea.l	$1E92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3392(a5)	; -> BioBalls_SetFormation
	lea.l	$1E82(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$8E(a4)
	lea.l	$10(a7),a7
	bne.s	loc_0BC6CC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC6E8
loc_0BC6CC:
	clr.w	$8C(a4)
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BC6E8:
	moveq	#$0,d0
	move.l	d0,$44(a3)
	pea.l	($FF).w
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a3)
	lea.l	sub_0BC58C(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
