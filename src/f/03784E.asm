; ---------------------------------------------------------------------------
; sub_03784E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_03784E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$8C(a4)
	beq.s	loc_0378A0
	tst.w	$AC(a4)
	bne.s	loc_0378A0
	move.w	$AA(a4),$AC(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_037888
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_037924(pc)
	addq.w	#$4,a7
	bra.s	loc_0378A0
loc_037888:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0378A0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
