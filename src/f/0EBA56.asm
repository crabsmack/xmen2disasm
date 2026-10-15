; ---------------------------------------------------------------------------
; CoreShields_Move - CoreShields: apply velocity (+$16/+$18), acceleration (+$1E/+$20) and speed limits (class slot 18, +$4E)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: method 18 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0EBA8C
	move.w	#$14,$6E(a4)
	addq.b	#$1,$91(a4)
	moveq	#$2,d0
	cmp.b	$91(a4),d0
	bge.s	loc_0EBA8C
	clr.b	$91(a4)
	addq.b	#$1,$90(a4)
	moveq	#$8,d0
	cmp.b	$90(a4),d0
	bgt.s	loc_0EBA8C
	clr.b	$90(a4)
loc_0EBA8C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
