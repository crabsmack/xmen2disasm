; ---------------------------------------------------------------------------
; Spark_StateStart - SPARK first state (Init's +$5C/+$64): start the animation, then either fly straight (type 1) or chase player 1
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_SetAnim(jt data $140152); +$8B (spawn byte 7) = 1 -> Obj_SnapToNearestSeg(this, 1000, -1), vx = vy = +$8C (spawn +$A, default $100), +$5C = Spark_StateFlyStraight; else +$8E = g_Player1, +$5C = Spark_StateStop
; ---------------------------------------------------------------------------
Spark_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3BBA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$1,d0
	cmp.b	$8B(a4),d0
	addq.w	#$8,a7
	bne.s	loc_13FF0A
	moveq	#-$1,d0
	move.l	d0,-(a7)
	pea.l	($3E8).w
	move.l	a4,-(a7)
	jsr	$4F32(a5)	; -> Obj_SnapToNearestSeg
	move.w	$8C(a4),$16(a4)
	move.w	$8C(a4),$18(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	Spark_StateFlyStraight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_13FF24
loc_13FF0A:
	lea.l	g_Player1(a5),a0
	move.l	a0,$8E(a4)
	clr.w	$6C(a4)
	lea.l	Spark_StateStop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13FF24:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
