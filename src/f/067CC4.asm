; ---------------------------------------------------------------------------
; sub_067CC4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_067CC4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	clr.b	$32(a0)
	movea.l	$8C(a4),a0
	clr.b	$34(a0)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	move.l	$30(a4),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> sub_1FB026
	cmpi.w	#$F8,$A2(a4)
	lea.l	$1C(a7),a7
	bne.s	loc_067D1E
	ori.b	#$10,$2E(a4)
	bra.s	loc_067D24
loc_067D1E:
	andi.b	#$EF,$2E(a4)
loc_067D24:
	move.l	a4,-(a7)
	jsr	sub_067420(pc)
	move.w	$A2(a4),d0
	ext.l	d0
	move.w	-$348E(a5),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$8,d1
	move.l	d1,$8(a4)
	move.w	-$3490(a5),d0
	ext.l	d0
	add.l	#$AE,d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0676F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
