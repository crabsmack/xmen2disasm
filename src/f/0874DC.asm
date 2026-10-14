; ---------------------------------------------------------------------------
; sub_0874DC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0874DC:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	-$3B14(a5),-(a7)
	move.w	d7,d1
	ext.l	d1
	move.l	d1,-(a7)
	move.w	d6,d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> sub_13F58A
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
