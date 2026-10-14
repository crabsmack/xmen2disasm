; ---------------------------------------------------------------------------
; sub_03713C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03713C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_037180(pc),a0
	move.l	a0,$90(a4)
	move.b	#$2,$B2(a4)
	move.w	#$73,$9E(a4)
	move.w	#$FFA6,$A0(a4)
	move.w	#$5A,$AA(a4)
	clr.w	$6C(a4)
	lea.l	sub_037180(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
