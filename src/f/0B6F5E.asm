; ---------------------------------------------------------------------------
; sub_0B6F5E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B6F5E:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$23,d7
	moveq	#-$1E,d5
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_0B6F96
	move.l	#$8000,d0
	bra.s	loc_0B6F98
loc_0B6F96:
	moveq	#$0,d0
loc_0B6F98:
	move.l	d0,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	beq.s	loc_0B6FB2
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
	ori.l	#$800,d6
loc_0B6FB2:
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	ext.l	d5
	move.l	d5,d4
	lsl.l	#$8,d4
	ori.l	#$A,d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> sub_119190
	pea.l	($EC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EC).w
	jsr	$521A(a5)	; -> Snd_Play
	tst.l	$A0(a4)
	lea.l	$20(a7),a7
	bne.s	loc_0B7006
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_0B7034
loc_0B7006:
	addq.w	#$1,$9E(a4)
	movea.l	$A0(a4),a0
	move.w	$9E(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0B701A
	clr.w	$9E(a4)
loc_0B701A:
	movea.l	$A0(a4),a0
	addq.l	#$2,a0
	move.w	$9E(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_0B7034:
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
