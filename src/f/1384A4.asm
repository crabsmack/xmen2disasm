; ---------------------------------------------------------------------------
; LaserCannon_StateReload - LaserCannon state: rest frame, wait the reload delay +$9E, then go idle
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetFrame(0); +$6C = +$9E (spawn word +8, default 90; -1 = no wait), +$5C = LaserCannon_StateIdle
; ---------------------------------------------------------------------------
LaserCannon_StateReload:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#-$1,d0
	cmp.w	$9E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_1384D8
	lea.l	LaserCannon_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	LaserCannon_StateIdle(pc)
	addq.w	#$4,a7
	bra.s	loc_1384EC
loc_1384D8:
	move.w	$9E(a4),$6C(a4)
	lea.l	LaserCannon_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1384EC:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
