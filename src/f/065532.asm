; ---------------------------------------------------------------------------
; sub_065532	[link-after-rts]
; ---------------------------------------------------------------------------
sub_065532:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	clr.b	-$38C6(a5)
	move.w	#$2,-$3B02(a5)
	jsr	$504A(a5)	; -> sub_1FA99C
	lea.l	-$1FDA(a5),a0
	movea.l	-$1FE6(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,-$1FE2(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,-$1FE6(a5)
	movea.l	d0,a0
	move.w	#$1C,(a0)
	movea.l	-$1FE6(a5),a0
	clr.b	$2(a0)
	movea.l	-$1FE6(a5),a0
	clr.w	$4(a0)
	movea.l	-$1FE6(a5),a0
	move.w	#$1C,$6(a0)
	jsr	$5052(a5)	; -> sub_1FA9D2
	move.b	#$1,-$1D4A(a5)
	movea.l	-$3B14(a5),a4
	bra.w	loc_06569A
loc_065596:
	move.b	(a4),d6
	addq.l	#$2,a4
	move.b	d6,d0
	subq.b	#$1,d0
	bcs.w	loc_065682
	cmpi.b	#$5,d0
	bhi.w	loc_065682
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$655B8(pc,d1.w),d1
	jmp	$655B6(pc,d1.w)
