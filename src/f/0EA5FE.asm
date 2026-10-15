; ---------------------------------------------------------------------------
; Hologram_Fire3_Bolts - Hologram attack 3: two HoloBolts with velocities (-$2AC,$122)/(-$28E,$140); next entry after 30 frames
; In:  8(a6) = this
; Out: none
; Evidence: HoloBolt_Spawn x2
; ---------------------------------------------------------------------------
Hologram_Fire3_Bolts:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($122).w
	move.l	#$FFFFFD54,-(a7)
	move.l	#$28100,-(a7)
	move.l	#$23000,-(a7)
	jsr	$2702(a5)	; -> HoloBolt_Spawn
	pea.l	($140).w
	move.l	#$FFFFFD72,-(a7)
	move.l	#$28100,-(a7)
	move.l	#$24100,-(a7)
	jsr	$2702(a5)	; -> HoloBolt_Spawn
	tst.l	$8E(a4)
	lea.l	$20(a7),a7
	bne.s	loc_0EA654
	move.l	$64(a4),$5C(a4)
	move.w	#$1E,$6C(a4)
	bra.s	loc_0EA682
loc_0EA654:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0EA668
	clr.w	$8C(a4)
loc_0EA668:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$1E,$6C(a4)
loc_0EA682:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
