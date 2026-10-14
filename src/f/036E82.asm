; ---------------------------------------------------------------------------
; sub_036E82	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036E82:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_036EC0(pc),a0
	move.l	a0,$90(a4)
	move.b	#$2,$B2(a4)
	move.w	#$82,$9E(a4)
	move.w	#$FF92,$A0(a4)
	clr.w	$6C(a4)
	lea.l	sub_036EC0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
