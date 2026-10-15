; ---------------------------------------------------------------------------
; ExplodeFx_BurstPuffInit - initialise a burst puff at a position
; In:  8(a6) = puff ($12 bytes)  $C(a6) = long x  $10(a6) = long y
; Out: none
; Evidence: puff {+0/+4 long x/y, +8/+A word vx/vy, +C/+E word ax/ay, +$10 byte frame<<4 | tick (6), +$11 byte type 1 = live}; caller ExplodeFx_Burst
; ---------------------------------------------------------------------------
ExplodeFx_BurstPuffInit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),(a4)
	move.l	$10(a6),$4(a4)
	clr.l	$8(a4)
	clr.l	$C(a4)
	move.b	#$6,$10(a4)
	move.b	#$1,$11(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
