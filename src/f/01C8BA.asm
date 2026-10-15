; ---------------------------------------------------------------------------
; sub_01C8BA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_01C8BA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.w	$B4(a4),d0
	beq.s	loc_01C942
	andi.w	#$FFFC,$B4(a4)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($DB).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	ori.w	#$2,$6(a4)
	tst.l	$9C(a4)
	lea.l	$14(a7),a7
	bne.s	loc_01C916
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_01C942
loc_01C916:
	addq.w	#$1,$9A(a4)
	movea.l	$9C(a4),a0
	move.w	$9A(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_01C92A
	clr.w	$9A(a4)
loc_01C92A:
	movea.l	$9C(a4),a0
	addq.l	#$2,a0
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_01C942:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
