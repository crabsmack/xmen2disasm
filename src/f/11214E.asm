; ---------------------------------------------------------------------------
; Deathbird_Move - move by flight kind +$AE: 3 = velocity + acceleration plus a wobble offset (+$A2/+$A4, clamped to +-100, pushed back when more than $60 px from the anchor +$92/+$96); 4 = Deathbird_MovePolar circling; any other kind does not move (Deathbird override of slot 18 Move; does not call the parent)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: kind set by Deathbird_SetMoveMode; previous velocity kept in +$1A/+$1C; method 18 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_Move:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	movea.l	$8(a6),a4
	move.b	$AE(a4),d0
	cmpi.b	#$4,d0
	bhi.w	Deathbird_Move_Done
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11214E(pc,d1.w),d1
	jmp	Sw_11214E-2(pc,d1.w)
