; ---------------------------------------------------------------------------
; sub_04C2AE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C2AE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$10,d1
	and.w	d0,d1
	bne.s	loc_04C2EC
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	move.w	#$78,$6C(a4)
	lea.l	sub_04C306(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04C2FE
loc_04C2EC:
	clr.w	$6C(a4)
	lea.l	sub_04C2AE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04C2FE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
