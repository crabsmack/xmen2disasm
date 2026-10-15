; ---------------------------------------------------------------------------
; ExplodeFx_TrailPuffInit - initialise a trail puff at a position (same as ExplodeFx_BurstPuffInit)
; In:  8(a6) = puff  $C(a6) = long x  $10(a6) = long y
; Out: none
; Evidence: same body as ExplodeFx_BurstPuffInit; caller ExplodeFx_Trail
; ---------------------------------------------------------------------------
ExplodeFx_TrailPuffInit:
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
