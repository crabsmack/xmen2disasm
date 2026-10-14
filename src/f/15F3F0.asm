; ---------------------------------------------------------------------------
; sub_15F3F0
; ---------------------------------------------------------------------------
sub_15F3F0:
	move.w	d6,d0
	subq.w	#$8,d0
	move.w	d5,d1
	lsr.w	d0,d1
	andi.w	#$FF,d1
	cmpi.w	#$FC,d1
	bge.w	loc_15F540
	add.w	d1,d1
	sub.b	(a1,d1.w),d6
	cmpi.w	#$9,d6
	bge.s	loc_15F416
	addq.w	#$8,d6
	asl.w	#$8,d5
	move.b	(a0)+,d5
loc_15F416:
	move.b	$1(a1,d1.w),d1
loc_15F41A:
	move.w	d1,d0
	andi.w	#$F,d1
	beq.w	loc_15F4D8
	asl.w	#$2,d1
	move.l	$15F456(pc,d1.w),d7
	andi.w	#$F0,d0
	beq.w	loc_15F500
	lsr.w	#$4,d0
	addq.w	#$1,d0
loc_15F436:
	move.w	d3,d1
	asl.w	#$2,d1
	move.l	$15F496(pc,d1.w),d1
	cmp.w	d3,d0
	beq.s	loc_15F4BA
	bgt.w	loc_15F4C8
	sub.w	d0,d3
	move.w	d3,d0
	asl.w	#$2,d0
	sub.l	$15F496(pc,d0.w),d1
	and.l	d7,d1
	or.l	d1,d4
	bra.s	sub_15F3F0
