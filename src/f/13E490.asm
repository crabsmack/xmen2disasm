; ---------------------------------------------------------------------------
; ExplodeFx_BounceGroupInit - initialise a bounce group: three puffs at one position, tick 15, one live
; In:  8(a6) = group  $C(a6) = long x  $10(a6) = long y
; Out: d0 = misc
; Evidence: x/y >> 5 into all three slots, velocities 0, +$1E.. = $0F, +$21 = 1; caller ExplodeFx_Bounce
; ---------------------------------------------------------------------------
ExplodeFx_BounceGroupInit:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	move.l	$10(a6),d5
	move.l	$C(a6),d6
	movea.l	$8(a6),a4
	clr.w	d7
	moveq	#$3,d3
loc_13E4A8:
	move.l	d6,d0
	asr.l	#$5,d0
	ext.l	d7
	move.l	d7,d1
	asl.l	#$2,d1
	move.l	d0,(a4,d1.l)
	move.l	d5,d0
	asr.l	#$5,d0
	ext.l	d7
	move.l	d7,d1
	asl.l	#$2,d1
	move.l	d0,$C(a4,d1.l)
	clr.b	$1B(a4,d7.w)
	clr.b	$18(a4,d7.w)
	move.b	#$F,$1E(a4,d7.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_13E4A8
	move.b	#$1,$21(a4)
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
