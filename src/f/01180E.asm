; ---------------------------------------------------------------------------
; BigAcolyte_ActWait30 - BIGACOLYTE script action: run the next script step after 30 frames
; In:  8(a6) = this
; Out: none
; Evidence: +$6C = $1E with +$5C = next script entry
; ---------------------------------------------------------------------------
BigAcolyte_ActWait30:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_01182C
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_01185A
loc_01182C:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_011840
	clr.w	$96(a4)
loc_011840:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_01185A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
