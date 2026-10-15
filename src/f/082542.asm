; ---------------------------------------------------------------------------
; DropBomb_StateFall - DROPBOMB state: fall under gravity until reaching the floor y found at Init, then explode
; In:  8(a6) = this
; Out: d0
; Evidence: x += vx, y += vy, v += accel (twice when -$38DE set); when y >> 8 >= +$8C (floor from sub_15A8FE in DropBomb_Init) clears velocity and sets handler DropBomb_StateExplode; TAS 48480-50062
; Found: link-after-rts
; ---------------------------------------------------------------------------
DropBomb_StateFall:
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
	tst.b	-$38DE(a5)
	beq.s	loc_08259A
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
loc_08259A:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$8C(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_0825C4
	clr.w	$18(a4)
	clr.w	$20(a4)
	clr.w	$6C(a4)
	lea.l	DropBomb_StateExplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0825C4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
