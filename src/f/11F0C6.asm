; ---------------------------------------------------------------------------
; BioBalls_ActClearAnim - BIOBALLS script action: clear the animation, next entry
; In:  8(a6) = this
; Out: none
; Evidence: +$44 = 0
; ---------------------------------------------------------------------------
BioBalls_ActClearAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.l	$8E(a4)
	bne.s	loc_11F0E8
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11F114
loc_11F0E8:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11F0FC
	clr.w	$8C(a4)
loc_11F0FC:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11F114:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
