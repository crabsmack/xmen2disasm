; ---------------------------------------------------------------------------
; sub_04C114	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04C114:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$FFEF,$8C(a4)
	movea.l	$96(a4),a0
	move.l	$8(a0),d0
	cmp.l	$8(a4),d0
	bge.s	loc_04C13A
	ori.b	#$10,$2E(a4)
	bra.s	loc_04C140
loc_04C13A:
	andi.b	#$EF,$2E(a4)
loc_04C140:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$5,$6C(a4)
	lea.l	sub_04C168(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
