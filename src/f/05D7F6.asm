; ---------------------------------------------------------------------------
; sub_05D7F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05D7F6:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$76(a3),d0
	cmp.l	$76(a4),d0
	addq.w	#$4,a7
	bne.s	loc_05D88E
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_05D82E
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	bra.s	loc_05D838
loc_05D82E:
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	neg.l	d0
loc_05D838:
	move.w	$98(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	cmp.l	d0,d1
	ble.s	loc_05D88E
	move.l	a3,$A4(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_05D85A
	ori.b	#$10,$2E(a4)
	bra.s	loc_05D860
loc_05D85A:
	andi.b	#$EF,$2E(a4)
loc_05D860:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_05D87C
	clr.w	$6C(a4)
	lea.l	sub_05D898(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05D88E
loc_05D87C:
	clr.w	$6C(a4)
	lea.l	sub_05D956(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05D88E:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
