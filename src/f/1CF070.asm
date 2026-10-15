; ---------------------------------------------------------------------------
; sub_1CF070	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CF070:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	move.w	$12(a6),d6
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	movea.l	$14(a6),a3
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.b	$D(a3),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.b	$C(a3),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1CF0BA
	moveq	#$1,d0
	bra.s	loc_1CF0BC
loc_1CF0BA:
	moveq	#$0,d0
loc_1CF0BC:
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$1,d0
	lea.l	$24(a7),a7
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
