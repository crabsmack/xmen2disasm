; ---------------------------------------------------------------------------
; loc_1FBC76
; ---------------------------------------------------------------------------
loc_1FBC76:
	cmpi.w	#$60,d7
	blt.s	loc_1FBCA2
	cmpi.w	#$1C0,d7
	bgt.s	loc_1FBCA2
	cmpi.w	#$60,d6
	blt.s	loc_1FBCA2
	cmpi.w	#$160,d6
	bgt.s	loc_1FBCA2
	swap	d6
	addq.l	#$8,a1
	move.b	$3(a1),d6
	move.l	d6,(a1)
	move.l	d7,$4(a1)
	cmpi.b	#$50,d6
	beq.s	loc_1FBCB4
loc_1FBCA2:
	swap	d7
	add.w	$1FBC56(pc,d3.w),d7
	addq.w	#$8,a4
	addq.w	#$1,d5
loc_1FBCAC:
	cmp.b	$10(a3),d5
	blt.w	loc_1FBBD0
loc_1FBCB4:
	move.l	a1,d1
	sub.l	-$1FE6(a5),d1
	asr.l	#$3,d1
	move.l	a1,-$1FE6(a5)
	add.w	d1,-$1FE2(a5)
loc_1FBCC4:
	movem.l	-$28(a6),d2-d7/a2-a4
	unlk	a6
	rts
