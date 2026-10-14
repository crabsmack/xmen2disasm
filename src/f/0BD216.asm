; ---------------------------------------------------------------------------
; sub_0BD216	[jt 1032]
; ---------------------------------------------------------------------------
sub_0BD216:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$2072(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	beq.s	loc_0BD260
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BD25A
	ori.b	#$10,$2E(a3)
loc_0BD25A:
	move.w	#$14,$6A(a3)
loc_0BD260:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
