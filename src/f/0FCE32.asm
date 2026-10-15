; ---------------------------------------------------------------------------
; SiberiaB1_DebrisInit - SiberiaB1: clear the 48 x 20-byte debris pool and remember it
; In:  8(a6) = pool
; Out: d0
; Evidence: pool $FFC6DC, count $FFC6F0
; ---------------------------------------------------------------------------
SiberiaB1_DebrisInit:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	-$3B10(a5)
	move.l	a4,-$3B24(a5)
	clr.w	d7
	moveq	#$30,d3
loc_0FCE4A:
	moveq	#$0,d0
	move.l	d0,(a4)
	move.l	d0,$4(a4)
	clr.l	$8(a4)
	clr.l	$C(a4)
	move.l	d0,$10(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	lea.l	$14(a4),a4
	cmp.w	d7,d3
	bgt.s	loc_0FCE4A
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
