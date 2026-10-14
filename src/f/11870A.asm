; ---------------------------------------------------------------------------
; sub_11870A	[jt 1470]
; ---------------------------------------------------------------------------
sub_11870A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	-$348E(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	$1C(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
