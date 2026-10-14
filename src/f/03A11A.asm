; ---------------------------------------------------------------------------
; sub_03A11A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03A11A:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$C(a4),d7
	sub.l	d0,d7
	cmpi.l	#$7D00,d7
	ble.s	loc_03A14C
	ori.w	#$4000,$6(a4)
	lea.l	sub_03A156(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_03A14C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
