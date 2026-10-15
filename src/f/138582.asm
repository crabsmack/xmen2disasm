; ---------------------------------------------------------------------------
; LaserCannon_StateAim - LaserCannon state: show the aim frame for 2 frames before a shot
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetFrame(4), +$6C = 2, +$5C = LaserCannon_StateFire
; ---------------------------------------------------------------------------
LaserCannon_StateAim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$2,$6C(a4)
	lea.l	LaserCannon_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
