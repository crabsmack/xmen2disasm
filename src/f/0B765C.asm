; ---------------------------------------------------------------------------
; sub_0B765C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B765C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.l	#$14000,$A6(a4)
	blt.s	loc_0B76A2
	move.l	#$14000,$A6(a4)
	lea.l	$1DBA(a5),a0
	move.l	$2(a0),-$38A4(a5)
	move.w	#$FBA8,$18(a4)
	move.w	#$60,$20(a4)
	clr.w	$6C(a4)
	lea.l	sub_0B76BC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0B76B4
loc_0B76A2:
	clr.w	$6C(a4)
	lea.l	sub_0B765C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0B76B4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
