; ---------------------------------------------------------------------------
; sub_142008	[jt 1923]
; ---------------------------------------------------------------------------
sub_142008:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_142032
	move.w	$9E(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_142038
loc_142032:
	move.w	$9E(a4),d0
	ext.l	d0
loc_142038:
	move.w	d0,$16(a4)
	move.w	$A0(a4),$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_141F18(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
