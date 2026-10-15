; ---------------------------------------------------------------------------
; TechWallGun_StateAimLevel - wall gun aiming level (frame 2): pick up, level or down by the target angle
; In:  8(a6) = this
; Out: d0
; Evidence: angle < -$16 -> TechWallGun_StateAimUp, < $17 -> TechWallGun_BurstLevel, else TechWallGun_StateAimDown
; ---------------------------------------------------------------------------
TechWallGun_StateAimLevel:
	link.w	a6,#$FFFE
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$2(a6)
	move.l	a4,-(a7)
	jsr	TechWallGun_AimWall(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_1428DE
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#-$16,d0
	cmp.w	-$2(a6),d0
	addq.w	#$8,a7
	ble.s	loc_1428B0
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateAimUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1428DE
loc_1428B0:
	moveq	#$16,d0
	cmp.w	-$2(a6),d0
	bge.s	loc_1428CC
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateAimDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1428DE
loc_1428CC:
	clr.w	$6C(a4)
	lea.l	TechWallGun_BurstLevel(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1428DE:
	movea.l	-$6(a6),a4
	unlk	a6
	rts
