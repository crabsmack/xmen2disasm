; ---------------------------------------------------------------------------
; sub_087B22	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087B22:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	cmpi.w	#$424,-$393C(a5)
	bne.s	loc_087B4E
	lea.l	-$13A8(a5),a3
	lea.l	-$3940(a5),a4
	clr.b	d7
	moveq	#$10,d3
loc_087B3E:
	move.w	(a3)+,(a4)+
	move.b	d7,d0
	addq.b	#$1,d7
	cmp.b	d7,d3
	bgt.s	loc_087B3E
	move.b	#$1,g_PalBaseDirty(a5)
loc_087B4E:
	movea.l	$8(a6),a0
	tst.w	$68(a0)
	bgt.s	loc_087B7A
	movea.l	$8(a6),a0
	move.w	#$FF,$6C(a0)
	lea.l	sub_087BAC(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
	bra.s	loc_087BA2
loc_087B7A:
	movea.l	$8(a6),a0
	movea.l	$92(a0),a0
	addq.l	#$2,a0
	movea.l	$8(a6),a1
	move.w	$90(a1),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	movea.l	a1,a0
	move.l	d0,$5C(a0)
	movea.l	$8(a6),a0
	move.w	#$A,$6C(a0)
loc_087BA2:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
