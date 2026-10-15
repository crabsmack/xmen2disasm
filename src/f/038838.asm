; ---------------------------------------------------------------------------
; sub_038838	[link-after-rts]
; ---------------------------------------------------------------------------
sub_038838:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$85A(a5),a0
	move.w	#$200,d0
	muls.w	$E(a6),d0
	movea.l	d0,a4
	adda.l	$2(a0),a4
	moveq	#$4,d6
	bra.s	loc_0388C6
loc_03885A:
	move.w	$6(a3),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	d7,d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	addq.l	#$4,d7
	adda.w	#$20,a4
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	d7,d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	addq.l	#$4,d7
	adda.w	#$20,a4
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	d7,d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	addq.l	#$4,d7
	adda.w	#$20,a4
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.l	d7,d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	addq.l	#$4,d7
	adda.w	#$20,a4
	lea.l	$30(a7),a7
	move.l	d6,d0
	subq.l	#$1,d6
	lea.l	$14(a3),a3
loc_0388C6:
	tst.l	d6
	bne.s	loc_03885A
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
