; ---------------------------------------------------------------------------
; sub_037F7E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_037F7E:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.w	loc_03802C
	move.l	$8(a4),d6
	sub.l	$8(a3),d6
	move.l	$C(a4),d7
	sub.l	$C(a3),d7
	asr.l	#$7,d6
	asr.l	#$6,d7
	add.l	d6,$8(a3)
	add.l	d7,$C(a3)
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.l	$C(a3),d7
	asr.l	#$8,d7
	move.l	$8(a4),d0
	asr.l	#$8,d0
	moveq	#$A,d1
	sub.l	d1,d0
	move.w	d0,-$4(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	subq.l	#$1,d0
	move.w	d0,-$2(a6)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d4
	add.l	d1,d4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	add.l	d1,d5
	cmp.w	-$4(a6),d6
	blt.s	loc_03802C
	cmp.w	d6,d4
	blt.s	loc_03802C
	cmp.w	-$2(a6),d7
	blt.s	loc_03802C
	cmp.w	d7,d5
	blt.s	loc_03802C
	move.l	$8(a4),$8(a3)
	move.l	$C(a4),$C(a3)
	move.l	a3,-(a7)
	jsr	$7D2(a5)	; -> MagnetoBoss_EnterOutroState
	pea.l	($F0).w
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	ThronePhone_EmptyHelper(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_03802C:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
