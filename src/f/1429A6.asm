; ---------------------------------------------------------------------------
; TechWallGun_StateCeilAimDown - ceiling gun aiming straight down (frame 8)
; In:  8(a6) = this
; Out: d0
; Evidence: angle < $44 -> TechWallGun_StateCeilAimRight, < $71 -> TechWallGun_BurstCeilDown, else TechWallGun_StateCeilAimLeft
; ---------------------------------------------------------------------------
TechWallGun_StateCeilAimDown:
	link.w	a6,#$FFFE
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$2(a6)
	move.l	a4,-(a7)
	jsr	TechWallGun_AimCeiling(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_142A1A
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$44,d0
	cmp.w	-$2(a6),d0
	addq.w	#$8,a7
	ble.s	loc_1429EC
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateCeilAimRight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_142A1A
loc_1429EC:
	moveq	#$70,d0
	cmp.w	-$2(a6),d0
	bge.s	loc_142A08
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateCeilAimLeft(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_142A1A
loc_142A08:
	clr.w	$6C(a4)
	lea.l	TechWallGun_BurstCeilDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_142A1A:
	movea.l	-$6(a6),a4
	unlk	a6
	rts
