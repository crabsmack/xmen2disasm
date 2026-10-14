; ---------------------------------------------------------------------------
; sub_114860	[link-after-rts]
; ---------------------------------------------------------------------------
sub_114860:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	ble.s	loc_11489E
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	tst.b	-$38DE(a5)
	beq.s	loc_11488A
	move.w	$1A(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
loc_11488A:
	clr.w	$6C(a4)
	lea.l	sub_114860(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1148AA
loc_11489E:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1148AA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
