; ---------------------------------------------------------------------------
; ExplodeFx_BounceGroupAim - give the three puffs of a bounce group byte velocities pointing away from the centre
; In:  8(a6) = group ($22 bytes)  $C(a6) = long centre x  $10(a6) = long centre y
; Out: d0 = misc
; Evidence: group {+0 3 long x (<<3 units), +$C 3 long y, +$18 3 byte vx, +$1B 3 byte vy, +$1E 3 byte frame<<4 | tick, +$21 byte live count}; vx = (x*32 - cx) >> 7, vy = (y*32 - cy) >> 8; caller ExplodeFx_Bounce
; ---------------------------------------------------------------------------
ExplodeFx_BounceGroupAim:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a3-a4,-(a7)
	move.l	$10(a6),d5
	move.l	$C(a6),d6
	movea.l	$8(a6),a0
	lea.l	$18(a0),a3
	lea.l	$1B(a0),a4
	clr.w	d7
	moveq	#$3,d3
loc_13E446:
	ext.l	d7
	movea.l	$8(a6),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
	lsl.l	#$5,d0
	sub.l	d6,d0
	asr.l	#$7,d0
	movea.l	$8(a6),a0
	move.b	d0,$18(a0,d7.w)
	ext.l	d7
	movea.l	$8(a6),a0
	move.l	d7,d0
	asl.l	#$2,d0
	move.l	$C(a0,d0.l),d0
	lsl.l	#$5,d0
	sub.l	d5,d0
	asr.l	#$8,d0
	movea.l	$8(a6),a0
	move.b	d0,$1B(a0,d7.w)
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_13E446
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
