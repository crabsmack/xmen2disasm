; ---------------------------------------------------------------------------
; SmallBrood_ActIdle - SMALLBROOD script action: stand still on frame 0 for $3C frames, then the next step
; In:  8(a6) = this
; Out: none
; Evidence: jt 589 (script action table); clears anim +$44, speed/accel; +$6C = $3C
; Found: jt 589
; ---------------------------------------------------------------------------
SmallBrood_ActIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_084894
	move.l	$64(a4),$5C(a4)
	move.w	#$3C,$6C(a4)
	bra.s	loc_0848C2
loc_084894:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0848A8
	clr.w	$96(a4)
loc_0848A8:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$3C,$6C(a4)
loc_0848C2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
