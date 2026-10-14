; ---------------------------------------------------------------------------
; sub_03750A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03750A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_037472(pc),a0
	move.l	a0,$90(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_03753A
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_037924(pc)
	addq.w	#$4,a7
	bra.s	loc_037552
loc_03753A:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_037552:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
