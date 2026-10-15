; ---------------------------------------------------------------------------
; Mine_StateStart - mine state: start the slow idle blink, then look for a target
; In:  8(a6) = mine record
; Out: none
; Evidence: +$10 = Tbl_MineAnimIdle (jt 1846), frame = script byte 7, +$18 = Mine_StatePickTarget
; ---------------------------------------------------------------------------
Mine_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$39D2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$10(a4)
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	clr.l	$14(a4)
	lea.l	Mine_StatePickTarget(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
