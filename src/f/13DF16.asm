; ---------------------------------------------------------------------------
; ExplodeFx_TrailSetHead - set the motion of a trail's head puff
; In:  8(a6) = puff  $C/$10(a6) = (unused)  $16(a6) = word vx  $1A(a6) = word vy  $1E(a6) = word ax  $22(a6) = word ay
; Out: none
; Evidence: +8..+E := vx, vy, ax, ay; +$10 = 0 (step counter); caller ExplodeFx_Trail for puff 0
; ---------------------------------------------------------------------------
ExplodeFx_TrailSetHead:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a6),$8(a4)
	move.w	$1A(a6),$A(a4)
	move.w	$1E(a6),$C(a4)
	move.w	$22(a6),$E(a4)
	clr.b	$10(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
