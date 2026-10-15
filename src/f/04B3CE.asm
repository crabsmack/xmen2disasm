; ---------------------------------------------------------------------------
; Apocalypse_MoveTo - APOCALYPSE: start a damped move to (x, y): acceleration from the distance and current velocity, scaled by 2^shift
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8.8 px), $14(a6) = shift
; Out: none
; Evidence: +$1E/+$20 accel = ((target - pos)/2 >> (2s-1)) - (vel >> s); target +$9A/+$9C; +$8C |= $10 (moving, cleared by Apocalypse_Move on arrival); +$A0 = 1 << s; 9 callers
; ---------------------------------------------------------------------------
Apocalypse_MoveTo:
	link.w	a6,#$FFF4
	movem.l	d4-d7/a4,-(a7)
	move.l	$10(a6),d4
	move.l	$C(a6),d5
	move.l	$14(a6),d7
	movea.l	$8(a6),a4
	move.l	d5,d0
	sub.l	$8(a4),d0
	asr.l	#$1,d0
	move.l	d0,-$C(a6)
	move.l	d4,d0
	sub.l	$C(a4),d0
	asr.l	#$1,d0
	move.l	d0,-$8(a6)
	move.l	d7,d0
	add.l	d7,d0
	move.l	d0,d6
	subq.l	#$1,d6
	move.l	-$C(a6),d0
	asr.l	d6,d0
	move.w	$16(a4),d1
	asr.w	d7,d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$4(a6)
	move.l	-$8(a6),d0
	asr.l	d6,d0
	move.w	$18(a4),d1
	asr.w	d7,d1
	ext.l	d1
	sub.l	d1,d0
	move.w	d0,-$2(a6)
	move.w	-$4(a6),$1E(a4)
	move.w	-$2(a6),$20(a4)
	move.l	d5,d0
	asr.l	#$8,d0
	move.w	d0,$9A(a4)
	move.l	d4,d0
	asr.l	#$8,d0
	move.w	d0,$9C(a4)
	ori.w	#$10,$8C(a4)
	moveq	#$1,d0
	lsl.l	d7,d0
	move.w	d0,$A0(a4)
	movem.l	-$20(a6),d4-d7/a4
	unlk	a6
	rts
