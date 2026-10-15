; ---------------------------------------------------------------------------
; TechWallGun_BurstDiagDown - fire a burst diagonally downward (direction 3, or 6 facing left)
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: TechWallGun_SetupBurst(anim $1432B6, TechWallGun_StateAimDown, 3/6)
; ---------------------------------------------------------------------------
TechWallGun_BurstDiagDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_1424F0
	moveq	#$6,d0
	bra.s	loc_1424F2
loc_1424F0:
	moveq	#$3,d0
loc_1424F2:
	move.l	d0,-(a7)
	pea.l	TechWallGun_StateAimDown(pc)
	lea.l	$3CD2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	TechWallGun_SetupBurst(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	TechWallGun_StateBurst(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
