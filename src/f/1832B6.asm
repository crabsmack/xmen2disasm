; ---------------------------------------------------------------------------
; sub_1832B6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1832B6:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.w	$16(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1832F8
	moveq	#$1,d0
	bra.s	loc_1832FA
loc_1832F8:
	moveq	#$0,d0
loc_1832FA:
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$2DCA(a5)	; -> sub_118136
	moveq	#$0,d0
	lea.l	$24(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
