; ---------------------------------------------------------------------------
; sub_10B7A0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_10B7A0:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$30(a4),d6
	move.w	$32(a4),d7
	move.w	-$348E(a5),d5
	move.w	-$3490(a5),d5
	move.w	d6,-$348E(a5)
	move.w	d7,-$3490(a5)
	move.w	-$348E(a5),d0
	cmp.w	-$3A8E(a5),d0
	ble.s	loc_10B7D4
	move.w	-$3A8E(a5),-$348E(a5)
loc_10B7D4:
	move.w	-$348E(a5),d0
	cmp.w	-$3A90(a5),d0
	bge.s	loc_10B7E4
	move.w	-$3A90(a5),-$348E(a5)
loc_10B7E4:
	move.w	-$3490(a5),d0
	cmp.w	-$3A92(a5),d0
	ble.s	loc_10B7F4
	move.w	-$3A92(a5),-$3490(a5)
loc_10B7F4:
	move.w	-$3490(a5),d0
	cmp.w	-$3A94(a5),d0
	bge.s	loc_10B804
	move.w	-$3A94(a5),-$3490(a5)
loc_10B804:
	move.w	-$348E(a5),-$3AC2(a5)
	move.w	-$3490(a5),-$3AC4(a5)
	move.w	-$3AC2(a5),-$3AC6(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A54(a5),a0
	jsr	(a0)
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	move.b	#$1,-$3A56(a5)
	move.b	-$3A64(a5),-$3A58(a5)
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
