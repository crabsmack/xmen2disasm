; ---------------------------------------------------------------------------
; Gambit_PointNearBody_Test - Gambit_PointNearBody tail: compare the point with the player box widened by d7 (x) and d6 (y)
; In:  a4 = player, d4/d5 = y/x, d6/d7 = margins
; Out: d0 = 1 inside, 0 outside
; Evidence: shared exit of the type switch cases
; ---------------------------------------------------------------------------
Gambit_PointNearBody_Test:
	moveq	#$0,d3
	ext.l	d5
	move.w	$4E(a4),d0
	ext.l	d0
	ext.l	d7
	sub.l	d7,d0
	cmp.l	d5,d0
	bgt.s	loc_1CF426
	ext.l	d5
	move.w	$52(a4),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	cmp.l	d5,d0
	blt.s	loc_1CF426
	ext.l	d4
	move.w	$4C(a4),d0
	ext.l	d0
	ext.l	d6
	sub.l	d6,d0
	cmp.l	d4,d0
	bgt.s	loc_1CF426
	ext.l	d4
	move.w	$50(a4),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	cmp.l	d4,d0
	blt.s	loc_1CF426
	moveq	#$1,d3
loc_1CF426:
	move.b	d3,d0
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
