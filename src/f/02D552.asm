; ---------------------------------------------------------------------------
; Exodus_StateRise - EXODUS: fly up (vy -200, ay -10) with a random drift
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: sub_15C222 random vx; next Exodus_StateRiseUntil
; ---------------------------------------------------------------------------
Exodus_StateRise:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$94(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d5
	sub.l	$8(a4),d5
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,d7
	sub.l	$C(a4),d7
	move.w	#$FF38,$18(a4)
	move.w	#$FFF6,$20(a4)
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D592
	move.l	d7,d0
	bra.s	loc_02D596
loc_02D592:
	move.l	d7,d0
	neg.l	d0
loc_02D596:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_02D5A8
	move.w	$18(a4),d1
	ext.l	d1
	bra.s	loc_02D5B0
loc_02D5A8:
	move.w	$18(a4),d1
	ext.l	d1
	neg.l	d1
loc_02D5B0:
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,d6
	move.l	d5,d0
	move.l	d6,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,$16(a4)
	ori.b	#$2,$AC(a4)
	ori.b	#$1,$AC(a4)
	clr.w	$6C(a4)
	lea.l	Exodus_StateRiseUntil(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
