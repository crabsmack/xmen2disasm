; ---------------------------------------------------------------------------
; sub_04BA08	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04BA08:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> sub_1FDEF8
	move.l	d0,d1
	mulu.w	#$AF,d0
	swap	d1
	mulu.w	#$AF,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	move.l	d0,d7
	swap	d7
	ext.l	d7
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5172(a5)	; -> sub_1FDEEA
	add.l	d0,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	move.l	d0,d5
	swap	d5
	ext.l	d5
	ext.l	d7
	move.l	#$100,d0
	sub.l	d7,d0
	move.l	d0,d6
	lsl.l	#$8,d6
	ext.l	d5
	move.l	d5,d0
	add.l	#$85,d0
	move.l	d0,d7
	lsl.l	#$8,d7
	moveq	#$5,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	sub_04B3CE(pc)
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_04BA9C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
