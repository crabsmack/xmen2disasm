; ---------------------------------------------------------------------------
; TechWallGun_BurstCeilDown - ceiling gun: fire a burst straight down (direction 8)
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: TechWallGun_SetupBurst(anim $1432DA, TechWallGun_StateCeilAimDown, 8)
; ---------------------------------------------------------------------------
TechWallGun_BurstCeilDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$8,d0
	move.l	d0,-(a7)
	pea.l	TechWallGun_StateCeilAimDown(pc)
	lea.l	$3CEA(a5),a0
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
