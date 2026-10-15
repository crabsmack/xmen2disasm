; ---------------------------------------------------------------------------
; LaserCannon_StatePickTarget - LaserCannon state: pick the nearest live player as target (+$94) and watch it for 60 frames
; In:  8(a6) = this
; Out: d0 = flags & 8, or 0 when no player is alive
; Evidence: Player_NearestLive (nearest player with flags $8000 set, else 0) -> +$94; +$6E = 60, +$5C = LaserCannon_StateWatchTarget
; ---------------------------------------------------------------------------
LaserCannon_StatePickTarget:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> Player_NearestLive
	move.l	d0,$94(a4)
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_13834E
	move.w	#$3C,$6E(a4)
	clr.w	$6C(a4)
	lea.l	LaserCannon_StateWatchTarget(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_13834E:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
