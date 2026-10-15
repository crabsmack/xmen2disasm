; ---------------------------------------------------------------------------
; TankLeft_Move - TANKLEFT slot +$4E: integrate velocity (twice at step 2) without track limits
; In:  8(a6) = this, $C(a6) = word step
; Out: none
; Evidence: Tank_Move minus the clamp
; ---------------------------------------------------------------------------
TankLeft_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	moveq	#$1,d0
	cmp.w	$E(a6),d0
	bge.s	loc_141DA0
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
loc_141DA0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
