; ---------------------------------------------------------------------------
; LaserCannon_StateLoadBurst - LaserCannon state: load the burst shot count and wait for the raise animation
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +$9A = shots per burst +$9C (spawn word +$A, default 3), +$6C = 2, +$5C = LaserCannon_StateWaitExtended
; ---------------------------------------------------------------------------
LaserCannon_StateLoadBurst:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9C(a4),$9A(a4)
	move.w	#$2,$6C(a4)
	lea.l	LaserCannon_StateWaitExtended(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
