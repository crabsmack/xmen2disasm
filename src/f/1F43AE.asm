; ---------------------------------------------------------------------------
; EntryPoint	[vector 1]
; ---------------------------------------------------------------------------
EntryPoint:
	tst.l	($A10008).l
	bne.s	loc_1F43BC
	tst.w	($A1000C).l
loc_1F43BC:
	bne.s	loc_1F443A
	lea.l	$1F443C(pc),a5
	movem.w	(a5)+,d5-d7
	movem.l	(a5)+,a0-a4
	move.b	-$10FF(a1),d0
	andi.b	#$F,d0
	beq.s	loc_1F43DC
	move.l	#$53454741,$2F00(a1)
loc_1F43DC:
	move.w	(a4),d0
	moveq	#$0,d0
	movea.l	d0,a6
	move.l	a6,usp
	moveq	#$17,d1
loc_1F43E6:
	move.b	(a5)+,d5
	move.w	d5,(a4)
	add.w	d7,d5
	dbra	d1,loc_1F43E6
	move.l	(a5)+,(a4)
	move.w	d0,(a3)
	move.w	d7,(a1)
	move.w	d7,(a2)
loc_1F43F8:
	btst	d0,(a1)
	bne.s	loc_1F43F8
	moveq	#$25,d2
loc_1F43FE:
	move.b	(a5)+,(a0)+
	dbra	d2,loc_1F43FE
	move.w	d0,(a2)
	move.w	d0,(a1)
	move.w	d7,(a2)
loc_1F440A:
	move.l	d0,-(a6)
	dbra	d6,loc_1F440A
	move.l	(a5)+,(a4)
	move.l	(a5)+,(a4)
	moveq	#$1F,d3
loc_1F4416:
	move.l	d0,(a3)
	dbra	d3,loc_1F4416
	move.l	(a5)+,(a4)
	moveq	#$13,d4
loc_1F4420:
	move.l	d0,(a3)
	dbra	d4,loc_1F4420
	moveq	#$3,d5
loc_1F4428:
	move.b	(a5)+,$11(a3)
	dbra	d5,loc_1F4428
	move.w	d0,(a2)
	movem.l	(a6),d0-d7/a0-a6
	move.w	#$2700,sr
loc_1F443A:
	bra.s	Boot_RegionCheck
