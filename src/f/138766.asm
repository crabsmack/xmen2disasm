; ---------------------------------------------------------------------------
; LineSegKiller_RemoveSegsInBox - delete every live collision segment of a type (or any type for $3E9) that lies inside a box, unlinking its neighbours
; In:  $A(a6) = word type ($3E9 = all)  $E(a6) = word left  $12(a6) = word top  $16(a6) = word right  $1A(a6) = word bottom (5 px slack)
; Out: none
; Evidence: walks g_Segs ($14-byte records up to g_SegHighWater): flag $80 and type +1 match and box +8..+E inside -> +0 = 0, +$13 = $FF, neighbour links +$10/+$11 cleared both ways; only caller LineSegKiller_Kill, TAS 52126
; ---------------------------------------------------------------------------
LineSegKiller_RemoveSegsInBox:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	move.w	$12(a6),d4
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	subq.w	#$5,d5
	subq.w	#$5,d4
	addq.w	#$5,$16(a6)
	addq.w	#$5,$1A(a6)
	lea.l	g_Segs(a5),a4
	clr.w	d7
	bra.w	loc_138838
loc_138790:
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.w	loc_138830
	move.b	$1(a4),d0
	ext.w	d0
	cmp.w	d6,d0
	beq.s	loc_1387B0
	cmpi.w	#$3E9,d6
	bne.w	loc_138830
loc_1387B0:
	cmp.w	$8(a4),d5
	bgt.s	loc_138830
	move.w	$16(a6),d0
	cmp.w	$C(a4),d0
	blt.s	loc_138830
	cmp.w	$A(a4),d4
	bgt.s	loc_138830
	move.w	$1A(a6),d0
	cmp.w	$E(a4),d0
	blt.s	loc_138830
	clr.b	(a4)
	move.b	#$FF,$13(a4)
	moveq	#$0,d0
	move.b	$10(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_138804
	moveq	#$0,d0
	move.b	$10(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	move.b	#$FF,$11(a0,d0.w)
	move.b	#$FF,$10(a4)
loc_138804:
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_138830
	moveq	#$0,d0
	move.b	$11(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	move.b	#$FF,$10(a0,d0.w)
	move.b	#$FF,$11(a4)
loc_138830:
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$14(a4),a4
loc_138838:
	cmp.w	g_SegHighWater(a5),d7
	ble.w	loc_138790
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
