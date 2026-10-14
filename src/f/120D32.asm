; ---------------------------------------------------------------------------
; sub_120D32	[link-after-rts]
; ---------------------------------------------------------------------------
sub_120D32:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	lsl.l	#$7,d7
	andi.b	#$F7,$2E(a4)
	lea.l	$3442(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> sub_1F4BA2
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d1
	ext.l	d1
	add.l	d0,d1
	lsl.l	#$7,d1
	move.l	d7,d0
	sub.l	d1,d0
	add.l	d0,$C(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_120DA2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
