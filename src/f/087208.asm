; ---------------------------------------------------------------------------
; sub_087208	[jt 638]
; ---------------------------------------------------------------------------
sub_087208:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	beq.s	loc_08722C
	clr.w	$6C(a4)
	lea.l	sub_087294(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08728C
loc_08722C:
	move.w	-$3490(a5),d0
	ext.l	d0
	add.l	#$C9,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	-$348E(a5),d0
	ext.l	d0
	moveq	#-$A,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	lea.l	$14F2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$14F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,$A2(a4)
	lea.l	$10(a7),a7
	beq.s	loc_087278
	movea.l	$A2(a4),a0
	move.w	#$200,$14(a0)
loc_087278:
	move.w	#$10,$6C(a4)
	lea.l	sub_087294(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_08728C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
