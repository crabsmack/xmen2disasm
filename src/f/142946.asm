; ---------------------------------------------------------------------------
; TechWallGun_StateCeilAimLeft - ceiling gun aiming down-left (frame 6)
; In:  8(a6) = this
; Out: d0
; Evidence: TechWallGun_AimCeiling; angle < $70 -> TechWallGun_StateCeilAimDown, else TechWallGun_BurstCeilLeft
; ---------------------------------------------------------------------------
TechWallGun_StateCeilAimLeft:
	link.w	a6,#$FFFE
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$2(a6)
	move.l	a4,-(a7)
	jsr	TechWallGun_AimCeiling(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_14299E
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$70,d0
	cmp.w	-$2(a6),d0
	addq.w	#$8,a7
	ble.s	loc_14298C
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateCeilAimDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_14299E
loc_14298C:
	clr.w	$6C(a4)
	lea.l	TechWallGun_BurstCeilLeft(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_14299E:
	movea.l	-$6(a6),a4
	unlk	a6
	rts
