; ---------------------------------------------------------------------------
; Barbarian_StandOn - BARBARIAN: stand on a floor segment - +$76 = it, walk limits +$9A/+$9C = its x range inset by 15, priority from the segment
; In:  8(a6) = this, $C(a6) = segment
; Out: none
; Evidence: DrawList_SetPriority re-sorts the draw priority; 2 callers
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StandOn:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$8(a3),d6
	move.w	$C(a3),d7
	cmp.w	d6,d7
	bge.s	loc_0BD704
	move.w	d6,d5
	move.w	d7,d6
	move.w	d5,d7
loc_0BD704:
	move.l	a3,$76(a4)
	move.w	d6,d0
	add.w	#$F,d0
	move.w	d0,$9A(a4)
	move.w	d7,d0
	sub.w	#$F,d0
	move.w	d0,$9C(a4)
	movea.l	$76(a4),a0
	move.b	$2(a0),$42(a4)
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	move.l	d1,-(a7)
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
