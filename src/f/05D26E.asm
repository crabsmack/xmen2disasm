; ---------------------------------------------------------------------------
; sub_05D26E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05D26E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$32,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E62(a5)	; -> sub_1F638A
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05D2BC
	eori.b	#$10,$2E(a4)
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$78,$6C(a4)
	lea.l	sub_05D1DA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05D2EE
loc_05D2BC:
	tst.w	$6E(a4)
	bgt.s	loc_05D2EE
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	addq.w	#$8,a7
	move.w	#$78,$6C(a4)
	lea.l	sub_05D1DA(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D2EE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
