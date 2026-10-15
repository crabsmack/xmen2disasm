; ---------------------------------------------------------------------------
; Ninja_Move - position += velocity, velocity += acceleration (twice at half rate, no speed limits); during the jump animation (jt $3C92) clip to the floor segments with Ninja_ClipToSegs (NINJA override of slot 18, +$4E; does not call the parent)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: method 18 of class descriptor $13D7FE (name string "NINJA", parent BIONPC)
; ---------------------------------------------------------------------------
Ninja_Move:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	moveq	#$1,d0
	cmp.w	$E(a6),d0
	bge.s	loc_13D236
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
loc_13D236:
	lea.l	$3A92(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_13D256
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	Ninja_ClipToSegs(pc)
	lea.l	$C(a7),a7
loc_13D256:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
