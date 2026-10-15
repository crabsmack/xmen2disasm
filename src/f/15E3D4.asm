; ---------------------------------------------------------------------------
; Actor_ContainsPoint - ACTOR slot +$16: test whether a point lies strictly inside the object's body box
; In:  8(a6) = object   $C(a6) = word: x   $10(a6) = word: y
; Out: d0 = 1 inside, else 0
; Evidence: +$4E < x < +$52 and +$4C < y < +$50
; ---------------------------------------------------------------------------
Actor_ContainsPoint:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	cmp.w	$4E(a4),d7
	ble.s	loc_15E404
	cmp.w	$52(a4),d7
	bge.s	loc_15E404
	cmp.w	$4C(a4),d6
	ble.s	loc_15E404
	cmp.w	$50(a4),d6
	bge.s	loc_15E404
	moveq	#$1,d0
	bra.s	loc_15E406
loc_15E404:
	moveq	#$0,d0
loc_15E406:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
