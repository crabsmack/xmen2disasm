; ---------------------------------------------------------------------------
; sub_0C0BAC	[jt 1111]
; ---------------------------------------------------------------------------
sub_0C0BAC:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$0,d5
	move.b	$AE(a4),d5
	move.l	g_FrameCounter(a5),d0
	lsr.l	d5,d0
	moveq	#$1,d1
	and.l	d0,d1
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$507A(a5)	; -> sub_1FB142
	move.w	-$3490(a5),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	move.l	d1,-(a7)
	move.w	-$348E(a5),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	move.l	d1,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> sub_1FB346
	lea.l	$14(a7),a7
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
