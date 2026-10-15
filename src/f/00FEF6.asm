; ---------------------------------------------------------------------------
; sub_00FEF6
; ---------------------------------------------------------------------------
sub_00FEF6:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$12(a6),d7
	movea.l	$C(a6),a4
	tst.b	$17(a6)
	beq.s	loc_00FF5E
	tst.b	$1A(a4)
	beq.s	loc_00FF20
	move.w	$C(a4),d0
	ext.l	d0
	lsl.l	#$7,d0
	bra.s	loc_00FF2A
loc_00FF20:
	move.w	$E(a4),d0
	muls.w	$C(a4),d0
	lsl.l	#$5,d0
loc_00FF2A:
	move.w	d0,d6
	pea.l	$FFAC(pc)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$C9E(a5)
	jsr	$50A2(a5)	; -> sub_1FC2E8
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$C9E(a5),-(a7)
	pea.l	$26(a3)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$50B2(a5)	; -> sub_1FC5FE
	move.l	d0,-$CA2(a5)
	lea.l	$1C(a7),a7
loc_00FF5E:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$C9E(a5),-(a7)
	pea.l	$26(a3)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$50B2(a5)	; -> sub_1FC5FE
	move.l	d0,-$CA2(a5)
	jsr	$50BA(a5)	; -> sub_1FC6CA
	tst.b	$1A(a4)
	lea.l	$14(a7),a7
	bne.s	loc_00FFA2
	move.w	$E(a4),d0
	muls.w	$C(a4),d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$C9E(a5),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	lea.l	$C(a7),a7
loc_00FFA2:
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
