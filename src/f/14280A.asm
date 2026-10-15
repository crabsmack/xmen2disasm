; ---------------------------------------------------------------------------
; TechWallGun_StateAimUp - wall gun aiming up (frame 0): fire up, or turn level when the target moved
; In:  8(a6) = this
; Out: d0
; Evidence: TechWallGun_AimWall; angle < -$15 -> TechWallGun_BurstDiagUp, else TechWallGun_StateAimLevel
; ---------------------------------------------------------------------------
TechWallGun_StateAimUp:
	link.w	a6,#$FFFE
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$2(a6)
	move.l	a4,-(a7)
	jsr	TechWallGun_AimWall(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_142862
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#-$16,d0
	cmp.w	-$2(a6),d0
	addq.w	#$8,a7
	bge.s	loc_142850
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateAimLevel(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_142862
loc_142850:
	clr.w	$6C(a4)
	lea.l	TechWallGun_BurstDiagUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_142862:
	movea.l	-$6(a6),a4
	unlk	a6
	rts
