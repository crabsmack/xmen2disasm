; ---------------------------------------------------------------------------
; loc_1FB9B8
; ---------------------------------------------------------------------------
loc_1FB9B8:
	cmpi.w	#$60,d7
	blt.s	loc_1FB9E8
	cmpi.w	#$1C0,d7
	bgt.s	loc_1FB9E8
	cmpi.w	#$60,d6
	blt.s	loc_1FB9E8
	cmpi.w	#$160,d6
	bgt.s	loc_1FB9E8
	swap	d6
	move.w	d4,d6
	asl.w	#$7,d6
	addq.l	#$8,a4
	move.b	$3(a4),d6
	move.l	d6,(a4)
	move.l	d7,$4(a4)
	cmpi.b	#$50,d6
	beq.s	loc_1FB9F2
loc_1FB9E8:
	addq.w	#$6,a3
	addq.w	#$1,d5
loc_1FB9EC:
	cmp.b	d3,d5
	blt.w	loc_1FB926
loc_1FB9F2:
	move.l	a4,d1
	sub.l	-$1FE6(a5),d1
	asr.l	#$3,d1
	move.l	a4,-$1FE6(a5)
	add.w	d1,-$1FE2(a5)
loc_1FBA02:
	movem.l	-$24(a6),d3-d7/a2-a4
	unlk	a6
	rts
