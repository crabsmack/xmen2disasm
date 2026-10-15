; ---------------------------------------------------------------------------
; XNpc_Move - just calls the parent (ACTOR) Move: velocity, acceleration and speed limits unchanged (XNPC override of slot 18, +$4E)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: body = parent +$4E(this, step); method 18 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_Move:
	link.w	a6,#$0
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$2BD2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
