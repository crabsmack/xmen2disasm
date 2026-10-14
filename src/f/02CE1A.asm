; ---------------------------------------------------------------------------
; sub_02CE1A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02CE1A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	cmp.l	$C(a4),d0
	bgt.s	loc_02CE4A
	andi.b	#$FE,$AC(a4)
	clr.w	$6C(a4)
	lea.l	sub_02CF04(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_02CE4A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
