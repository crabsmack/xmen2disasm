; ---------------------------------------------------------------------------
; sub_120F00	[link-after-rts]
; ---------------------------------------------------------------------------
sub_120F00:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_120E2C(pc)
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.w	$A2(a4)
	lea.l	$10(a7),a7
	ble.s	loc_120F42
	move.w	#$C,$6C(a4)
	lea.l	sub_121062(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_120F5C
loc_120F42:
	move.w	$9E(a4),$6E(a4)
	move.w	#$19,$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_120F5C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
