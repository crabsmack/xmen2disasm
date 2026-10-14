; ---------------------------------------------------------------------------
; sub_107658	[link-after-rts]
; ---------------------------------------------------------------------------
sub_107658:
	link.w	a6,#$0
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_10768C
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_107696
loc_10768C:
	movea.l	$8(a6),a0
	move.w	#$C0,$42(a0)
loc_107696:
	unlk	a6
	rts
