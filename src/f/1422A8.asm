; ---------------------------------------------------------------------------
; sub_1422A8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1422A8:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$9A(a4),d0
	beq.s	loc_1422C4
	subq.w	#$1,d0
	beq.s	loc_1422D4
	subq.w	#$1,d0
	beq.s	loc_1422E4
	bra.s	loc_1422F2
loc_1422C4:
	move.l	$8(a4),d6
	add.l	#$1000,d6
	move.l	$C(a4),d7
	bra.s	loc_1422F2
loc_1422D4:
	move.l	$8(a4),d6
	move.l	$C(a4),d7
	add.l	#$2000,d7
	bra.s	loc_1422F2
loc_1422E4:
	move.l	$8(a4),d6
	sub.l	#$1000,d6
	move.l	$C(a4),d7
loc_1422F2:
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1422FE
	moveq	#$1,d0
	bra.s	loc_142300
loc_1422FE:
	moveq	#$0,d0
loc_142300:
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	lea.l	$10(a7),a7
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
