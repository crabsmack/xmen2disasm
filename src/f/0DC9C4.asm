; ---------------------------------------------------------------------------
; sub_0DC9C4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DC9C4:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3F62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.b	#$1,$96(a4)
	move.w	$94(a4),d4
	move.w	$92(a4),d6
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,d7
	sub.w	#$10,d7
	move.w	d7,d5
	add.w	#$20,d5
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$15,d1
	move.l	d1,-(a7)
	jsr	$4F1A(a5)	; -> sub_1F7C6A
	movea.l	d0,a3
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
