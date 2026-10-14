; ---------------------------------------------------------------------------
; sub_098CC8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_098CC8:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	d7
	lea.l	$2B9A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098CEE
	lea.l	$190A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098CF4
loc_098CEE:
	moveq	#$1,d7
	bra.w	loc_098D9C
loc_098CF4:
	lea.l	$2BCA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D0C
	lea.l	$191A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D12
loc_098D0C:
	moveq	#$2,d7
	bra.w	loc_098D9C
loc_098D12:
	lea.l	$2BC2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D2A
	lea.l	$1922(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D2E
loc_098D2A:
	moveq	#$3,d7
	bra.s	loc_098D9C
loc_098D2E:
	lea.l	$2BBA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D46
	lea.l	$192A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D4A
loc_098D46:
	moveq	#$4,d7
	bra.s	loc_098D9C
loc_098D4A:
	lea.l	$2BA2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D62
	lea.l	$1932(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D66
loc_098D62:
	moveq	#$5,d7
	bra.s	loc_098D9C
loc_098D66:
	lea.l	$2BAA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D7E
	lea.l	$193A(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D82
loc_098D7E:
	moveq	#$6,d7
	bra.s	loc_098D9C
loc_098D82:
	lea.l	$2BB2(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	beq.s	loc_098D9A
	lea.l	$1942(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_098D9C
loc_098D9A:
	moveq	#$7,d7
loc_098D9C:
	move.w	d7,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
