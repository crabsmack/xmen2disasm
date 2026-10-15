; ---------------------------------------------------------------------------
; Spark_StateDart - SPARK state: dart toward a jittered point near its target (40 px above it) for 40 frames
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: v = ((target + random >> 10) - pos) / 4 with y - $2800, halved until |vx|+|vy| <= $128 (max speed set in Spark_Init); +$6C = 40, +$5C = Spark_StateStop; target +$8E = g_Player1
; ---------------------------------------------------------------------------
Spark_StateDart:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8E(a4),a0
	move.l	$8(a0),d5
	move.l	$C(a0),d6
	sub.l	#$2800,d6
	jsr	$417A(a5)	; -> Rand_Next
	move.w	d0,d7
	moveq	#$1,d0
	and.w	d7,d0
	beq.s	loc_13FF8E
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_13FF94
loc_13FF8E:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_13FF94:
	moveq	#$A,d1
	asr.l	d1,d0
	add.l	d0,d5
	jsr	$417A(a5)	; -> Rand_Next
	move.w	d0,d7
	moveq	#$1,d0
	and.w	d7,d0
	beq.s	loc_13FFAC
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_13FFB2
loc_13FFAC:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_13FFB2:
	moveq	#$A,d1
	asr.l	d1,d0
	add.l	d0,d6
	move.l	d5,d0
	sub.l	$8(a4),d0
	asr.l	#$2,d0
	move.w	d0,$16(a4)
	move.l	d6,d0
	sub.l	$C(a4),d0
	asr.l	#$2,d0
	move.w	d0,$18(a4)
	move.w	$16(a4),d5
	move.w	$18(a4),d6
	bra.s	loc_13FFEE
loc_13FFDA:
	move.w	$16(a4),d0
	asr.w	#$1,d0
	move.w	d0,$16(a4)
	move.w	$18(a4),d0
	asr.w	#$1,d0
	move.w	d0,$18(a4)
loc_13FFEE:
	tst.w	$16(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_140000
	move.w	$16(a4),d0
	ext.l	d0
	bra.s	loc_140008
loc_140000:
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
loc_140008:
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_14001A
	move.w	$18(a4),d1
	ext.l	d1
	bra.s	loc_140022
loc_14001A:
	move.w	$18(a4),d1
	ext.l	d1
	neg.l	d1
loc_140022:
	add.l	d0,d1
	cmpi.l	#$128,d1
	bgt.s	loc_13FFDA
	move.w	#$28,$6C(a4)
	lea.l	Spark_StateStop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
