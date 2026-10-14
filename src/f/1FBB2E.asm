; ---------------------------------------------------------------------------
; loc_1FBB2E
; ---------------------------------------------------------------------------
loc_1FBB2E:
	swap	d6
	addq.w	#$8,a1
	move.b	$3(a1),d6
	move.l	d6,(a1)
	move.l	d7,$4(a1)
	swap	d7
	add.w	$1FBB0E(pc,d3.w),d7
	addq.w	#$8,a4
	addq.w	#$1,d5
loc_1FBB46:
	cmp.b	d0,d5
	blt.w	loc_1FBA88
	move.l	a1,-$1FE6(a5)
	add.w	d5,-$1FE2(a5)
loc_1FBB54:
	movem.l	-$28(a6),d2-d7/a2-a4
	unlk	a6
	rts
