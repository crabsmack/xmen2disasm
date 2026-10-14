; ---------------------------------------------------------------------------
; sub_0E9B2E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0E9B2E:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	sub.l	#$140,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$1C,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$4F4A(a5)	; -> sub_1F82CC
	movea.l	d0,a3
	ori.b	#$40,(a3)
	move.l	a3,$9E(a4)
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
