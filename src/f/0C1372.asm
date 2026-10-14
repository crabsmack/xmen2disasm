; ---------------------------------------------------------------------------
; sub_0C1372	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C1372:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_0C1398
	moveq	#$0,d0
	bra.s	loc_0C140A
loc_0C1398:
	lea.l	$2B9A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13A8
	moveq	#$1,d0
	bra.s	loc_0C140A
loc_0C13A8:
	lea.l	$2BA2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13B8
	moveq	#$2,d0
	bra.s	loc_0C140A
loc_0C13B8:
	lea.l	$2BBA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13C8
	moveq	#$3,d0
	bra.s	loc_0C140A
loc_0C13C8:
	lea.l	$2BC2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13D8
	moveq	#$4,d0
	bra.s	loc_0C140A
loc_0C13D8:
	lea.l	$2BB2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13E8
	moveq	#$5,d0
	bra.s	loc_0C140A
loc_0C13E8:
	lea.l	$2BCA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C13F8
	moveq	#$6,d0
	bra.s	loc_0C140A
loc_0C13F8:
	lea.l	$2BAA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0C1408
	moveq	#$7,d0
	bra.s	loc_0C140A
loc_0C1408:
	moveq	#$0,d0
loc_0C140A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
