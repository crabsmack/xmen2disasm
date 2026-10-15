; ---------------------------------------------------------------------------
; sub_037180	[link-after-rts]
; ---------------------------------------------------------------------------
sub_037180:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$39F,g_CameraX(a5)
	blt.s	loc_0371C0
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	($B0).w
	pea.l	($39F).w
	moveq	#$2,d1
	move.l	d1,-(a7)
	jsr	$72A(a5)	; -> sub_0358D8
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_037210(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_037208
loc_0371C0:
	tst.l	$8C(a4)
	beq.s	loc_037208
	tst.w	$AC(a4)
	bne.s	loc_037208
	move.w	$AA(a4),$AC(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_0371F0
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_037924(pc)
	addq.w	#$4,a7
	bra.s	loc_037208
loc_0371F0:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	sub_037924(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_037208:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
