; ---------------------------------------------------------------------------
; Apocalypse_StartJitter - APOCALYPSE: small random accelerations around its target (hover wobble)
; In:  8(a6) = this
; Out: none
; Evidence: sub_15C222 random when more than 1 px away; +$A0 = -100
; ---------------------------------------------------------------------------
Apocalypse_StartJitter:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,d6
	lsl.l	#$1,d6
	move.w	$9C(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,d7
	lsl.l	#$1,d7
	tst.w	d6
	sge.b	d3
	neg.b	d3
	beq.s	loc_04B4A0
	ext.l	d6
	move.l	d6,d0
	bra.s	loc_04B4A6
loc_04B4A0:
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
loc_04B4A6:
	move.w	d0,d4
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_04B4B6
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_04B4BC
loc_04B4B6:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_04B4BC:
	move.w	d0,d5
	cmpi.w	#$2,d4
	bge.s	loc_04B4C8
	clr.w	d6
	bra.s	loc_04B4EA
loc_04B4C8:
	move.w	$16(a4),d0
	muls.w	$16(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	ext.l	d4
	move.l	d4,d7
	lsl.l	#$8,d7
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d7,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,d6
loc_04B4EA:
	cmpi.w	#$2,d5
	bge.s	loc_04B4F4
	clr.w	d7
	bra.s	loc_04B516
loc_04B4F4:
	move.w	$16(a4),d0
	muls.w	$16(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	ext.l	d5
	move.l	d5,d4
	lsl.l	#$8,d4
	move.w	-$2(a6),d0
	ext.l	d0
	move.l	d4,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.w	d0,d7
loc_04B516:
	move.w	d6,$1E(a4)
	move.w	d7,$20(a4)
	move.w	#$FF9C,$A0(a4)
	movem.l	-$1A(a6),d3-d7/a4
	unlk	a6
	rts
