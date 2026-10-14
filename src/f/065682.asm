; ---------------------------------------------------------------------------
; loc_065682
; ---------------------------------------------------------------------------
loc_065682:
	moveq	#$0,d0
	move.b	d6,d0
	move.w	d0,d5
	subq.w	#$7,d5
	movea.l	a4,a3
	adda.w	(a4)+,a3
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a3,-(a7)
	jsr	sub_064F70(pc)
	addq.w	#$8,a7
loc_06569A:
	tst.b	(a4)
	bne.w	loc_065596
	move.w	#$FFFF,-$3B02(a5)
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
