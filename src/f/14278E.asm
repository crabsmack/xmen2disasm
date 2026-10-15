; ---------------------------------------------------------------------------
; TechWallGun_AimCeiling - ceiling gun: is the nearest player in range and below; if so give its aim angle
; In:  8(a6) = this, $C(a6) = pointer word angle
; Out: d0 = 1 target found
; Evidence: Player_Nearest; |dx| < +$9E and dy - 30 >= 0; angle = (TechWallGun_AimAngle(dx, dy) + 2) >> 2
; ---------------------------------------------------------------------------
TechWallGun_AimCeiling:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	sub.l	$8(a4),d0
	move.l	d0,d7
	asr.l	#$8,d7
	move.l	$C(a3),d0
	sub.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,d6
	sub.w	#$1E,d6
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_1427CC
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_1427D2
loc_1427CC:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_1427D2:
	move.w	d0,d5
	cmp.w	$9E(a4),d5
	addq.w	#$4,a7
	bge.s	loc_1427E0
	tst.w	d6
	bge.s	loc_1427E4
loc_1427E0:
	moveq	#$0,d0
	bra.s	loc_142800
loc_1427E4:
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	TechWallGun_AimAngle(pc)
	ext.l	d0
	addq.l	#$2,d0
	asr.l	#$2,d0
	movea.l	$C(a6),a0
	move.w	d0,(a0)
	moveq	#$1,d0
	addq.w	#$8,a7
loc_142800:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
