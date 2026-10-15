; ---------------------------------------------------------------------------
; sub_1449E6	[jt 1952]
; ---------------------------------------------------------------------------
sub_1449E6:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3D5A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$3D82(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$4,$68(a4)
	ori.w	#$80,$6(a4)
	ori.w	#$1,$6(a4)
	ori.w	#$200,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_144A80
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_144A78
	ori.b	#$4,$2E(a4)
	bra.s	loc_144AC6
loc_144A78:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_144AC6
loc_144A80:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_144AB0
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_144AA8
	ori.b	#$4,$2E(a4)
	bra.s	loc_144AC6
loc_144AA8:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_144AC6
loc_144AB0:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_144AC0
	ori.b	#$4,$2E(a4)
	bra.s	loc_144AC6
loc_144AC0:
	andi.b	#$FB,$2E(a4)
loc_144AC6:
	move.b	$B(a3),$42(a4)
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
