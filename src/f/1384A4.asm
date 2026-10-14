; ---------------------------------------------------------------------------
; sub_1384A4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1384A4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#-$1,d0
	cmp.w	$9E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_1384D8
	lea.l	sub_1382E4(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1382E4(pc)
	addq.w	#$4,a7
	bra.s	loc_1384EC
loc_1384D8:
	move.w	$9E(a4),$6C(a4)
	lea.l	sub_1382E4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1384EC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
