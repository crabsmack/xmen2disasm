; ---------------------------------------------------------------------------
; sub_04BDB4	[jt 342]
; ---------------------------------------------------------------------------
sub_04BDB4:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$10000,d7
	move.l	#$8C00,d6
	cmp.l	$8(a4),d7
	ble.s	loc_04BDDA
	andi.b	#$EF,$2E(a4)
	bra.s	loc_04BDE0
loc_04BDDA:
	ori.b	#$10,$2E(a4)
loc_04BDE0:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$9E(a4),d0
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	sub_04B3CE(pc)
	lea.l	sub_04BF52(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_04BF52(pc)
	lea.l	$1C(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
