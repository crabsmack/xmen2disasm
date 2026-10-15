; ---------------------------------------------------------------------------
; loc_15F57E	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_15F57E:
	move.l	d4,(a4)
	subq.w	#$1,d2
	beq.s	loc_15F58C
	subq.w	#$1,-$3B04(a5)
	beq.s	loc_15F590
	rts
loc_15F58C:
	movea.l	(a7)+,a0
	rts
loc_15F590:
	movem.l	d0-d1/a0,-(a7)
	addq.w	#$1,-$3B06(a5)
	move.w	#$8,-$3B04(a5)
	moveq	#$0,d0
	move.w	-$3B06(a5),d0
	move.l	d0,d1
	asr.w	#$3,d0
	add.l	$1C(a6),d0
	movea.l	d0,a0
	andi.w	#$7,d1
	moveq	#$1,d0
	asl.l	d1,d0
	and.b	(a0),d0
	beq.s	loc_15F5C0
	lea.l	loc_15F57E(pc),a3
	bra.s	loc_15F5C4
loc_15F5C0:
	lea.l	$15F580(pc),a3
loc_15F5C4:
	movem.l	(a7)+,d0-d1/a0
	rts
