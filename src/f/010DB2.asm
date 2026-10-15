; ---------------------------------------------------------------------------
; BigAcolyte_StateWaitArrive - BIGACOLYTE state: wait until both target flags are set, then the next script step after 120 frames
; In:  8(a6) = this
; Out: none
; Evidence: +$A6 and +$A7 arrived flags; script +$98 / index +$96, default +$64
; ---------------------------------------------------------------------------
BigAcolyte_StateWaitArrive:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$A7(a4)
	beq.s	loc_010E0C
	tst.b	$A6(a4)
	beq.s	loc_010E0C
	tst.l	$98(a4)
	bne.s	loc_010DDC
	move.l	$64(a4),$5C(a4)
	move.w	#$78,$6C(a4)
	bra.s	loc_010E1E
loc_010DDC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_010DF0
	clr.w	$96(a4)
loc_010DF0:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$78,$6C(a4)
	bra.s	loc_010E1E
loc_010E0C:
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateWaitArrive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_010E1E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
