; ---------------------------------------------------------------------------
; sub_1F6B9C	[jt 2516]
; ---------------------------------------------------------------------------
sub_1F6B9C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($3E9).w
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$4F4A(a5)	; -> Seg_FindContaining
	lea.l	$C(a7),a7
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_1F6B56(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
