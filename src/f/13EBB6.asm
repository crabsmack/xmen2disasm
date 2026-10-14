; ---------------------------------------------------------------------------
; sub_13EBB6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13EBB6:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$15(a4),d0
	cmpi.b	#$2,d0
	bcc.s	loc_13EBFA
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.s	loc_13EC1C
loc_13EBFA:
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$C,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_13EC1C:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
