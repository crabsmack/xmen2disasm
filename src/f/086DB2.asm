; ---------------------------------------------------------------------------
; BroodBoss_ActWait30 - BROODBOSS script action: wait $1E frames, then the next step
; In:  8(a6) = this
; Out: none
; Evidence: next-step idiom with +$6C = $1E; jt 632
; ---------------------------------------------------------------------------
BroodBoss_ActWait30:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$92(a4)
	bne.s	loc_086DD0
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_086DFE
loc_086DD0:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_086DE4
	clr.w	$90(a4)
loc_086DE4:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_086DFE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
