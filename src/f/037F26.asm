; ---------------------------------------------------------------------------
; sub_037F26	[link-after-rts]
; ---------------------------------------------------------------------------
sub_037F26:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.s	loc_037F74
	addq.b	#$1,$92(a4)
	moveq	#$0,d0
	move.b	$92(a4),d0
	moveq	#$1,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.l	a3,-(a7)
	jsr	$7CA(a5)	; -> sub_036AC6
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_037F7E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_037F74:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
