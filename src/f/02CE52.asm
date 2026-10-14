; ---------------------------------------------------------------------------
; sub_02CE52	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02CE52:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$14(a3),d0
	movea.l	-$38D6(a5),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a4
	move.b	$A8(a3),d0
	cmpi.b	#$5,d0
	bhi.s	loc_02CEF6
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$2CE86(pc,d1.w),d1
	jmp	$2CE84(pc,d1.w)
