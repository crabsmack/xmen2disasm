; ---------------------------------------------------------------------------
; sub_005466	[irq hook $21C]
; ---------------------------------------------------------------------------
sub_005466:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	jsr	$418A(a5)	; -> sub_160550
	clr.b	-$202(a5)
	clr.b	-$18AC(a5)
loc_00547A:
	moveq	#$2,d0
	and.w	($C00004).l,d0
	bne.s	loc_00547A
	clr.w	d7
loc_005486:
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5132(a5)	; -> sub_1FDD26
	lea.l	-$3A40(a5),a0
	move.b	d0,(a0,d7.w)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$6,d7
	ble.s	loc_005486
	jsr	$4192(a5)	; -> Sys_InitHardware
	jsr	$5042(a5)	; -> sub_1FA956
	clr.b	-$38BE(a5)
	clr.b	-$3A08(a5)
	move.b	#$1,-$3A0C(a5)
	jsr	$4FC2(a5)	; -> sub_1F9850
loc_0054BC:
	clr.b	-$3A1A(a5)
	jsr	sub_005CC6(pc)
	bra.s	loc_0054BC
