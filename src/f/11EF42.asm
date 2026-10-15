; ---------------------------------------------------------------------------
; BioBalls_ActClearDone - BIOBALLS script action: clear the done flag (+$96), next entry
; In:  8(a6) = this
; Out: none
; Evidence: BioBalls_IsDone reads +$96
; ---------------------------------------------------------------------------
BioBalls_ActClearDone:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$96(a4)
	tst.l	$8E(a4)
	bne.s	loc_11EF62
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11EF8E
loc_11EF62:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11EF76
	clr.w	$8C(a4)
loc_11EF76:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11EF8E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
