; ---------------------------------------------------------------------------
; TechWallGun_BurstCeilLeft - ceiling gun: fire a burst down-left (direction 7)
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: TechWallGun_SetupBurst(anim Tbl_Anim_1432D0 (jt $3CE2), TechWallGun_StateCeilAimLeft, 7)
; ---------------------------------------------------------------------------
TechWallGun_BurstCeilLeft:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$7,d0
	move.l	d0,-(a7)
	pea.l	TechWallGun_StateCeilAimLeft(pc)
	lea.l	$3CE2(a5),a0
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
