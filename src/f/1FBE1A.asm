; ---------------------------------------------------------------------------
; loc_1FBE1A
; ---------------------------------------------------------------------------
loc_1FBE1A:
	move.w	#$80,d0
	add.w	d0,d7
	cmpi.w	#$60,d7
	blt.s	loc_1FBE66
	cmpi.w	#$1C0,d7
	bgt.s	loc_1FBE66
	add.w	d0,d6
	cmpi.w	#$60,d6
	blt.s	loc_1FBE66
	cmpi.w	#$160,d6
	bgt.s	loc_1FBE66
	moveq	#$0,d0
	movea.l	-$1FE6(a5),a0
	move.b	$3(a0),d0
	cmpi.w	#$50,d0
	beq.s	loc_1FBE8A
	move.w	d0,-$1FE2(a5)
	asl.w	#$3,d0
	lea.l	-$1FDA(a5),a0
	adda.w	d0,a0
	move.l	a0,-$1FE6(a5)
	swap	d6
	move.b	$3(a0),d6
	move.l	d6,(a0)+
	move.l	d7,(a0)
	bra.s	loc_1FBE6A
loc_1FBE66:
	st.b	-$1(a6)
loc_1FBE6A:
	swap	d7
	add.w	$1FBDFA(pc,d3.w),d7
loc_1FBE70:
	addq.w	#$8,a4
	addq.w	#$1,d5
loc_1FBE74:
	cmp.b	$10(a3),d5
	blt.w	loc_1FBD36
loc_1FBE7C:
	move.b	-$1(a6),d0
	movem.l	-$28(a6),d2-d7/a2-a4
	unlk	a6
	rts
loc_1FBE8A:
	moveq	#-$1,d0
	movem.l	-$28(a6),d2-d7/a2-a4
	unlk	a6
	rts
