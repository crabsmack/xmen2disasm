; ---------------------------------------------------------------------------
; sub_0EC622	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EC622:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$92(a4),d0
	beq.s	loc_0EC638
	subq.b	#$1,d0
	beq.s	loc_0EC64E
	bra.s	loc_0EC660
loc_0EC638:
	move.w	#$FF,$6C(a4)
	lea.l	sub_0EC622(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0EC660
loc_0EC64E:
	clr.w	$6C(a4)
	lea.l	sub_0EC668(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EC660:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
