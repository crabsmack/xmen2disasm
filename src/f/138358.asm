; ---------------------------------------------------------------------------
; LaserCannon_StateWatchTarget - LaserCannon state: start a burst when the target is in range in front of the gun, else optionally turn toward it; re-pick after the +$6E timer
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: target box within +/-200 px x and +/-60 px y of the cannon box centre and on the facing side (+$2E bit 4) -> LaserCannon_StateExtend; +$A2 (spawn word +$E) set = face the target; +$6E = 0 -> LaserCannon_StatePickTarget
; ---------------------------------------------------------------------------
LaserCannon_StateWatchTarget:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$94(a4),a3
	move.w	$4E(a3),d0
	ext.l	d0
	sub.l	#$C8,d0
	move.w	d0,-$4(a6)
	move.w	$4C(a3),d0
	ext.l	d0
	moveq	#$3C,d1
	sub.l	d1,d0
	move.w	d0,-$2(a6)
	move.w	$52(a3),d0
	ext.l	d0
	move.l	d0,d4
	add.l	#$C8,d4
	move.w	$50(a3),d0
	ext.l	d0
	move.l	d0,d5
	add.l	d1,d5
	move.w	$52(a4),d0
	ext.l	d0
	move.w	$4E(a4),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	move.l	d2,d6
	asr.l	#$8,d6
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d0,d2
	lsl.l	#$7,d2
	move.l	d2,d7
	asr.l	#$8,d7
	move.w	-$4(a6),d0
	ext.l	d0
	cmp.l	d6,d0
	bgt.s	loc_13842A
	ext.l	d4
	cmp.l	d6,d4
	blt.s	loc_13842A
	move.w	-$2(a6),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_13842A
	ext.l	d5
	cmp.l	d7,d5
	blt.s	loc_13842A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_13840C
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	ble.s	loc_13842A
	clr.w	$6C(a4)
	lea.l	LaserCannon_StateExtend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_138464
loc_13840C:
	move.l	$8(a4),d0
	cmp.l	$8(a3),d0
	bge.s	loc_13842A
	clr.w	$6C(a4)
	lea.l	LaserCannon_StateExtend(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_138464
loc_13842A:
	tst.b	$A2(a4)
	beq.s	loc_13844C
	movea.l	$94(a4),a0
	move.l	$8(a0),d0
	cmp.l	$8(a4),d0
	bge.s	loc_138446
	ori.b	#$10,$2E(a4)
	bra.s	loc_13844C
loc_138446:
	andi.b	#$EF,$2E(a4)
loc_13844C:
	tst.w	$6E(a4)
	bne.s	loc_138464
	clr.w	$6C(a4)
	lea.l	LaserCannon_StatePickTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_138464:
	movem.l	-$1C(a6),d4-d7/a3-a4
	unlk	a6
	rts
