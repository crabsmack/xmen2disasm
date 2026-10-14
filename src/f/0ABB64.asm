; ---------------------------------------------------------------------------
; sub_0ABB64	[jt 867]
; ---------------------------------------------------------------------------
sub_0ABB64:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.l	$8(a6),-(a7)
	jsr	sub_0ABB42(pc)
	moveq	#$1,d3
	moveq	#$0,d0
	move.b	-$3B5A(a5),d0
	cmp.w	-$359C(a5),d0
	beq.s	loc_0ABB90
	moveq	#$0,d0
	move.b	-$3B5E(a5),d0
	cmp.w	-$359C(a5),d0
	beq.s	loc_0ABB90
	moveq	#$0,d3
loc_0ABB90:
	tst.b	d3
	beq.s	loc_0ABB98
	moveq	#$0,d0
	bra.s	loc_0ABB9A
loc_0ABB98:
	moveq	#$2,d0
loc_0ABB9A:
	move.w	d0,d7
	ext.l	d7
	move.l	d7,-(a7)
	lea.l	$1ACA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3C3A(a5)
	lea.l	$C(a7),a7
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
