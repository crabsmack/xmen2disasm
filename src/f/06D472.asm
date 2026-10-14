; ---------------------------------------------------------------------------
; sub_06D472	[jt 518]
; ---------------------------------------------------------------------------
sub_06D472:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	ori.w	#$1,$B2(a4)
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_06D49A
	ori.b	#$10,$2E(a4)
	bra.s	loc_06D4A0
loc_06D49A:
	andi.b	#$EF,$2E(a4)
loc_06D4A0:
	lea.l	sub_06DA42(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	lea.l	$1022(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$3C,$6A(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
