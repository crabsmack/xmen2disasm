; ---------------------------------------------------------------------------
; LaserCannon_StateStart - LaserCannon first state (Init's +$5C and +$64): set flags bit 3 and go idle
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +4 |= 8, +$6C = 0, +$5C = LaserCannon_StateIdle; installed by LaserCannon_Init; floor gun (TAS 10846-12983, screenshot f010870)
; ---------------------------------------------------------------------------
LaserCannon_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$8,$4(a4)
	clr.w	$6C(a4)
	lea.l	LaserCannon_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
