; ---------------------------------------------------------------------------
; sub_064AEC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_064AEC:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	-$3B30(a5),a3
	tst.b	$3C(a4)
	blt.s	loc_064B0E
	move.b	$3C(a4),d0
	ext.w	d0
	cmp.w	-$3B0E(a5),d0
	blt.s	loc_064B22
loc_064B0E:
	move.w	#$FF38,$36(a4)
	move.w	#$FF38,$38(a4)
	dc.w	$197C,$FFFF,$003C	; move.b #$ff, $3c(a4)
	bra.s	loc_064B4A
loc_064B22:
	move.b	$3C(a4),d0
	ext.w	d0
	ext.l	d0
	add.l	d0,d0
	moveq	#$0,d1
	move.b	(a3,d0.l),d1
	move.w	d1,$36(a4)
	move.b	$3C(a4),d0
	ext.w	d0
	ext.l	d0
	add.l	d0,d0
	moveq	#$0,d1
	move.b	$1(a3,d0.l),d1
	move.w	d1,$38(a4)
loc_064B4A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
