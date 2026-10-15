; ---------------------------------------------------------------------------
; Apocalypse_StateWaitArrive - APOCALYPSE: when the move has arrived run the next script step
; In:  8(a6) = this
; Out: none
; Evidence: +$8C bit 4
; ---------------------------------------------------------------------------
Apocalypse_StateWaitArrive:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.w	$8C(a4),d0
	moveq	#$10,d1
	and.w	d0,d1
	bne.s	loc_04BAF0
	tst.l	$A4(a4)
	bne.s	loc_04BAC4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_04BAF0
loc_04BAC4:
	addq.w	#$1,$A2(a4)
	movea.l	$A4(a4),a0
	move.w	$A2(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_04BAD8
	clr.w	$A2(a4)
loc_04BAD8:
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_04BAF0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
