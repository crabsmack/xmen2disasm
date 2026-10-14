; ---------------------------------------------------------------------------
; sub_04BE76	[jt 344]
; ---------------------------------------------------------------------------
sub_04BE76:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	move.l	d0,$96(a4)
	movea.l	d0,a3
	move.l	$8(a3),d6
	move.l	#$8200,d7
	move.l	#$8C00,d5
	cmp.l	$8(a4),d6
	addq.w	#$4,a7
	ble.s	loc_04BEB4
	andi.b	#$EF,$2E(a4)
	move.l	d7,d0
	neg.l	d0
	move.l	d0,d7
	bra.s	loc_04BEBA
loc_04BEB4:
	ori.b	#$10,$2E(a4)
loc_04BEBA:
	move.l	d6,d4
	add.l	d7,d4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$9E(a4),d0
	move.l	d0,-(a7)
	move.l	d5,-(a7)
	move.l	d4,-(a7)
	move.l	a4,-(a7)
	jsr	sub_04B3CE(pc)
	lea.l	sub_04BF52(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_04BF52(pc)
	lea.l	$1C(a7),a7
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
