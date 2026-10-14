; ---------------------------------------------------------------------------
; sub_036D3C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036D3C:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d7
	lea.l	$762(a5),a0
	move.l	$2(a0),-$38A4(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0369F0(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_036DA8
	moveq	#$11,d0
	move.l	d0,-(a7)
	pea.l	($180).w
	moveq	#$0,d1
	move.b	d7,d1
	move.l	d1,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$6,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_035DC2(pc)
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_036DF0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_036DBA
loc_036DA8:
	clr.w	$6C(a4)
	lea.l	sub_036DC4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036DBA:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
