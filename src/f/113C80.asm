; ---------------------------------------------------------------------------
; XNpc_Move - XNpc: apply velocity (+$16/+$18), acceleration (+$1E/+$20) and speed limits (class slot 18, +$4E)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: method 18 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
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
