; ---------------------------------------------------------------------------
; Barbarian_StateLeapEdge - BARBARIAN state: aim at the near edge of the target segment and try to leap; else give up after $1E frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLeapEdge:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BE24E
	movea.l	$AA(a4),a0
	move.w	$8(a0),d0
	add.w	#$F,d0
	move.w	d0,$9E(a4)
	bra.s	loc_0BE25E
loc_0BE24E:
	movea.l	$AA(a4),a0
	move.w	$C(a0),d0
	sub.w	#$F,d0
	move.w	d0,$9E(a4)
loc_0BE25E:
	move.l	a4,-(a7)
	jsr	Barbarian_SetupLeap(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BE27E
	clr.w	$6C(a4)
	lea.l	Barbarian_StateLeap(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BE292
loc_0BE27E:
	move.w	#$1E,$6C(a4)
	lea.l	Barbarian_StateGiveUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE292:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
