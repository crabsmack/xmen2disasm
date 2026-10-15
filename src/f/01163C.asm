; ---------------------------------------------------------------------------
; BigAcolyte_StateCheckPlayersLow - BIGACOLYTE: if a player is below y $3F3 keep shooting (after 15 frames), else the next script step
; In:  8(a6) = this
; Out: d0
; Evidence: tests g_Player1/g_Player2 y (+$C) >> 8
; ---------------------------------------------------------------------------
BigAcolyte_StateCheckPlayersLow:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	clr.b	d7
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_011674
	move.l	-$174C(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$3F4,d0
	blt.s	loc_011674
	moveq	#$1,d6
loc_011674:
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_01169C
	move.l	-$183C(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$3F4,d0
	blt.s	loc_01169C
	moveq	#$1,d7
loc_01169C:
	tst.b	d6
	bne.s	loc_0116A4
	tst.b	d7
	beq.s	loc_0116BA
loc_0116A4:
	move.w	#$F,$6C(a4)
	lea.l	BigAcolyte_StateShootAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0116F8
loc_0116BA:
	tst.l	$98(a4)
	bne.s	loc_0116CC
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0116F8
loc_0116CC:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0116E0
	clr.w	$96(a4)
loc_0116E0:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0116F8:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
