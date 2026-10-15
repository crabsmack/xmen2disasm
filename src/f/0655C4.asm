; ---------------------------------------------------------------------------
; loc_0655C4	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_0655C4:
	move.b	(a4)+,d0
	ext.w	d0
	move.w	-$3C56(a5),d1
	add.w	d0,d1
	move.w	d1,-$3B04(a5)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	-$3C58(a5),d1
	add.w	d0,d1
	move.w	d1,-$3B06(a5)
	bra.w	loc_06569A
loc_0655E4:
	move.w	(a4)+,d7
	moveq	#$3,d0
	cmp.b	(a4),d0
	beq.s	loc_0655F0
	tst.b	(a4)
	bne.s	loc_0655F6
loc_0655F0:
	move.w	#$2,-$3B02(a5)
loc_0655F6:
	jsr	sub_064E9C(pc)
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	subq.w	#$1,d7
	tst.w	d7
	beq.w	loc_06569A
	moveq	#$2,d0
	cmp.w	-$3B02(a5),d0
	beq.s	loc_0655F6
	bra.w	loc_06569A
loc_065612:
	move.w	#$2,-$3B02(a5)
	jsr	sub_065400(pc)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	-$3C56(a5),d1
	add.w	d0,d1
	move.w	d1,-$3B04(a5)
	move.b	(a4)+,d0
	ext.w	d0
	move.w	-$3C58(a5),d1
	add.w	d0,d1
	move.w	d1,-$3B06(a5)
	bra.s	loc_06569A
