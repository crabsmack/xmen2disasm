; ---------------------------------------------------------------------------
; Cam_TrackObject - camera tracking fn: keep the target object (+$24) inside the dead-zone box +$3C..+$42
; In:  8(a6) = this
; Out: none
; Evidence: x unless +$4A bit 1, y unless bit 2; installed by Cam_FollowObject
; ---------------------------------------------------------------------------
Cam_TrackObject:
	link.w	a6,#$FFFC
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$24(a4),a3
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d7
	asr.l	#$8,d7
	move.w	$3C(a4),-$4(a6)
	move.w	$40(a4),-$2(a6)
	move.w	$3E(a4),d4
	move.w	$42(a4),d5
	moveq	#$1,d0
	and.w	$4A(a4),d0
	bne.s	loc_1617C0
	ext.l	d6
	move.w	$30(a4),d0
	ext.l	d0
	move.w	-$4(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d6,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_16179C
	move.w	d6,d0
	sub.w	-$4(a6),d0
	bra.s	loc_1617BC
loc_16179C:
	ext.l	d6
	move.w	$30(a4),d0
	ext.l	d0
	ext.l	d4
	add.l	d4,d0
	cmp.l	d6,d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1617B6
	move.w	d6,d0
	sub.w	d4,d0
	bra.s	loc_1617BC
loc_1617B6:
	move.w	$30(a4),d0
	ext.l	d0
loc_1617BC:
	move.w	d0,$30(a4)
loc_1617C0:
	moveq	#$2,d0
	and.w	$4A(a4),d0
	bne.s	loc_16180C
	ext.l	d7
	move.w	$32(a4),d0
	ext.l	d0
	move.w	-$2(a6),d1
	ext.l	d1
	add.l	d0,d1
	cmp.l	d7,d1
	sgt.b	d3
	neg.b	d3
	beq.s	loc_1617E8
	move.w	d7,d0
	sub.w	-$2(a6),d0
	bra.s	loc_161808
loc_1617E8:
	ext.l	d7
	move.w	$32(a4),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	cmp.l	d7,d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_161802
	move.w	d7,d0
	sub.w	d5,d0
	bra.s	loc_161808
loc_161802:
	move.w	$32(a4),d0
	ext.l	d0
loc_161808:
	move.w	d0,$32(a4)
loc_16180C:
	movem.l	-$20(a6),d3-d7/a3-a4
	unlk	a6
	rts
