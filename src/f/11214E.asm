; ---------------------------------------------------------------------------
; Deathbird_Move - Deathbird: apply velocity (+$16/+$18), acceleration (+$1E/+$20) and speed limits (class slot 18, +$4E)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: method 18 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Move:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
	move.b	$AE(a4),d0
	cmpi.b	#$4,d0
	bhi.w	loc_112330
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11214E(pc,d1.w),d1
	jmp	Sw_11214E-2(pc,d1.w)
