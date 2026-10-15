; ---------------------------------------------------------------------------
; sub_1F00F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F00F6:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$50(a4),d7
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$10,d1
	and.b	$2E(a4),d1
	bne.s	loc_1F013E
	move.w	$4E(a4),d6
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ext.l	d6
	move.w	$4E(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	lsl.l	#$8,d1
	add.l	d1,$8(a4)
	addq.w	#$8,a7
	bra.s	loc_1F0166
loc_1F013E:
	move.w	$52(a4),d6
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DDA(a5)	; -> Obj_UpdateBox
	ext.l	d6
	move.w	$52(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	lsl.l	#$8,d1
	add.l	d1,$8(a4)
	addq.w	#$8,a7
loc_1F0166:
	ext.l	d7
	move.w	$50(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	lsl.l	#$8,d1
	add.l	d1,$C(a4)
	move.b	#$1,-$3892(a5)
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
