; ---------------------------------------------------------------------------
; sub_1F293A	[jt 2451]
; ---------------------------------------------------------------------------
sub_1F293A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	and.l	$90(a4),d0
	bne.s	loc_1F2968
	movea.l	$8C(a4),a0
	move.w	$18(a4),d0
	cmp.w	$4E(a0),d0
	ble.s	loc_1F2968
	move.w	$18(a4),d0
	cmp.w	$50(a0),d0
	bge.s	loc_1F2968
	moveq	#$1,d0
	bra.s	loc_1F296A
loc_1F2968:
	moveq	#$0,d0
loc_1F296A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
