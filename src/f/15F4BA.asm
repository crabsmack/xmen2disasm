; ---------------------------------------------------------------------------
; loc_15F4BA
; ---------------------------------------------------------------------------
loc_15F4BA:
	and.l	d7,d1
	or.l	d1,d4
	jsr	(a3)
	moveq	#$0,d4
	moveq	#$8,d3
	bra.w	sub_15F3F0
loc_15F4C8:
	and.l	d7,d1
	or.l	d1,d4
	jsr	(a3)
	sub.w	d3,d0
	moveq	#$0,d4
	moveq	#$8,d3
	bra.w	loc_15F436
loc_15F4D8:
	andi.w	#$F0,d0
	lsr.w	#$4,d0
	addq.w	#$1,d0
loc_15F4E0:
	cmp.w	d3,d0
	beq.s	loc_15F4EC
	bgt.s	loc_15F4F6
	sub.w	d0,d3
	bra.w	sub_15F3F0
loc_15F4EC:
	jsr	(a3)
	moveq	#$0,d4
	moveq	#$8,d3
	bra.w	sub_15F3F0
loc_15F4F6:
	jsr	(a3)
	sub.w	d3,d0
	moveq	#$0,d4
	moveq	#$8,d3
	bra.s	loc_15F4E0
loc_15F500:
	move.w	d3,d1
	asl.w	#$2,d1
	move.l	$15F51C(pc,d1.w),d1
	and.l	d7,d1
	or.l	d1,d4
	subq.w	#$1,d3
	bne.w	sub_15F3F0
	jsr	(a3)
	moveq	#$0,d4
	moveq	#$8,d3
	bra.w	sub_15F3F0
