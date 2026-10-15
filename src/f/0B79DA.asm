; ---------------------------------------------------------------------------
; ChildShip_ActWait20 - CHILDSHIP script action: wait $14 frames, next step
; In:  8(a6) = this
; Out: none
; Evidence: jt 937
; Found: jt 937
; ---------------------------------------------------------------------------
ChildShip_ActWait20:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9A(a4)
	bne.s	loc_0B79F8
	move.l	$64(a4),$5C(a4)
	move.w	#$14,$6C(a4)
	bra.s	loc_0B7A26
loc_0B79F8:
	addq.w	#$1,$98(a4)
	movea.l	$9A(a4),a0
	move.w	$98(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B7A0C
	clr.w	$98(a4)
loc_0B7A0C:
	movea.l	$9A(a4),a0
	addq.l	#$2,a0
	move.w	$98(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$14,$6C(a4)
loc_0B7A26:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
