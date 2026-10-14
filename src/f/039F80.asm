; ---------------------------------------------------------------------------
; sub_039F80	[link-after-rts]
; ---------------------------------------------------------------------------
sub_039F80:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_03A010
	move.l	a4,-(a7)
	jsr	$4D72(a5)	; -> sub_1F429E
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_039FB8
	moveq	#$0,d0
	bra.s	loc_03A012
loc_039FB8:
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_039FD0
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	bra.s	loc_039FDA
loc_039FD0:
	move.l	$8(a4),d0
	sub.l	$8(a3),d0
	neg.l	d0
loc_039FDA:
	cmpi.l	#$1400,d0
	bge.s	loc_03A010
	move.l	$C(a4),d0
	sub.l	$C(a3),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_039FFA
	move.l	$C(a4),d0
	sub.l	$C(a3),d0
	bra.s	loc_03A004
loc_039FFA:
	move.l	$C(a4),d0
	sub.l	$C(a3),d0
	neg.l	d0
loc_03A004:
	cmpi.l	#$100,d0
	bge.s	loc_03A010
	moveq	#$0,d0
	bra.s	loc_03A012
loc_03A010:
	moveq	#$1,d0
loc_03A012:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
