; ---------------------------------------------------------------------------
; sub_0945E0	[jt 685]
; ---------------------------------------------------------------------------
sub_0945E0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$15E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$15EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	lea.l	sub_0946BA(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0946BA(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$5083,$6(a4)
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09466C
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_094664
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_094664:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0946B2
loc_09466C:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_09469C
	moveq	#$4,d0
	and.b	-$181A(a5),d0
	beq.s	loc_094694
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_094694:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0946B2
loc_09469C:
	moveq	#$4,d0
	and.b	-$172A(a5),d0
	beq.s	loc_0946AC
	ori.b	#$4,$2E(a4)
	bra.s	loc_0946B2
loc_0946AC:
	andi.b	#$FB,$2E(a4)
loc_0946B2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
