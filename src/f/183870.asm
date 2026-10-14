; ---------------------------------------------------------------------------
; sub_183870	[link-after-rts]
; ---------------------------------------------------------------------------
sub_183870:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_18389E
	tst.w	$6E(a4)
	ble.s	loc_18389E
	clr.w	$6C(a4)
	lea.l	sub_183870(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1838B0
loc_18389E:
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1838B0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
