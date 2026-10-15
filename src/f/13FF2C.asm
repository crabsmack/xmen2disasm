; ---------------------------------------------------------------------------
; Spark_StateStop - SPARK state: stop for 10 frames, then dart again
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: velocity/acceleration cleared, +$6C = 10, +$5C = Spark_StateDart
; ---------------------------------------------------------------------------
Spark_StateStop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$A,$6C(a4)
	lea.l	Spark_StateDart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
