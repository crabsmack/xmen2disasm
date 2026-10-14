; ---------------------------------------------------------------------------
; sub_0644D4
; ---------------------------------------------------------------------------
sub_0644D4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.l	-$C9E(a5),-(a7)
	movea.l	$4(a4),a0
	pea.l	$26(a0)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	(a4),-(a7)
	jsr	$50B2(a5)	; -> sub_1FC5FE
	jsr	$50BA(a5)	; -> sub_1FC6CA
	movea.l	(a4),a0
	tst.b	$1A(a0)
	beq.s	loc_064512
	move.b	#$1,$31(a4)
	bra.s	loc_064516
loc_064512:
	clr.b	$31(a4)
loc_064516:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
