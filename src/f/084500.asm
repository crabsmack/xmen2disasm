; ---------------------------------------------------------------------------
; sub_084500	[jt 586]
; ---------------------------------------------------------------------------
sub_084500:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$1242(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.s	loc_08453C
	tst.w	$B0(a4)
	beq.s	loc_08453C
	subq.w	#$1,$B0(a4)
	tst.w	$B0(a4)
	bge.s	loc_08453C
	clr.w	$B0(a4)
loc_08453C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
