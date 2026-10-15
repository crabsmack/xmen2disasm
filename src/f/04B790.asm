; ---------------------------------------------------------------------------
; Apocalypse_StateDropBombs - APOCALYPSE: while fewer than 6 bombs are alive drop the next bomb of the pattern after its delay; at the pattern end advance to the next pattern (0-5)
; In:  8(a6) = this
; Out: d0
; Evidence: bomb count -$3B08; ApocBomb_Spawn(speed, param) spawns a bomb; next Apocalypse_StateBombsDone
; ---------------------------------------------------------------------------
Apocalypse_StateDropBombs:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	clr.w	d7
	moveq	#$5,d0
	cmp.w	-$3B08(a5),d0
	blt.s	loc_04B810
	movea.l	$A8(a4),a0
	move.w	(a0),d5
	move.w	$2(a0),d7
	moveq	#$0,d0
	move.w	d5,d0
	move.l	d0,-(a7)
	move.w	$AC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$BD2(a5)	; -> ApocBomb_Spawn
	addq.l	#$4,$A8(a4)
	movea.l	$A8(a4),a0
	moveq	#$0,d0
	move.w	(a0),d0
	cmpi.l	#$FFFF,d0
	addq.w	#$8,a7
	bne.s	loc_04B7F8
	moveq	#$1,d6
	addq.b	#$1,$AE(a4)
	moveq	#$0,d0
	move.b	$AE(a4),d0
	cmpi.b	#$5,d0
	bls.s	loc_04B7F0
	clr.b	$AE(a4)
loc_04B7F0:
	move.l	a4,-(a7)
	jsr	Apocalypse_SelectBombPattern(pc)
	addq.w	#$4,a7
loc_04B7F8:
	tst.b	d6
	beq.s	loc_04B810
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateBombsDone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_04B83E
loc_04B810:
	moveq	#$0,d0
	move.w	d7,d0
	moveq	#-$1,d1
	cmp.l	d0,d1
	bne.s	loc_04B82C
	lea.l	Apocalypse_StateDropBombs(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Apocalypse_StateDropBombs(pc)
	addq.w	#$4,a7
	bra.s	loc_04B83E
loc_04B82C:
	move.w	d7,$6C(a4)
	lea.l	Apocalypse_StateDropBombs(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_04B83E:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
