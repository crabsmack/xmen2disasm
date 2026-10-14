; ---------------------------------------------------------------------------
; sub_05C07C	[jt 415]
; ---------------------------------------------------------------------------
sub_05C07C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$D22(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_05C0D4
	move.l	$10(a6),d0
	beq.s	loc_05C0BA
	subq.l	#$1,d0
	beq.s	loc_05C0C8
loc_05C0BA:
	lea.l	sub_05B614(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	bra.s	loc_05C0D4
loc_05C0C8:
	lea.l	sub_05B5D4(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
loc_05C0D4:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
