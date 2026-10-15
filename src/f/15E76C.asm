; ---------------------------------------------------------------------------
; sub_15E76C	[jt 2068]
; ---------------------------------------------------------------------------
sub_15E76C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	move.w	#$1800,d0
	and.w	$4(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	cmpi.l	#$1800,d1
	bne.s	loc_15E7C8
	move.w	-$CA8(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	move.w	-$CAA(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	move.w	$16(a3),$16(a4)
	move.w	$18(a3),$18(a4)
	move.w	$1E(a3),$1E(a4)
	move.w	$20(a3),$20(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_15E7C8:
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15E7E0
	pea.l	sub_15E76C(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> Obj_ForEachChild
	addq.w	#$8,a7
loc_15E7E0:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
