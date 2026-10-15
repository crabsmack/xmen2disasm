; ---------------------------------------------------------------------------
; Barbarian_StateScrollTiles - BARBARIAN state: every $3C frames shift 8 map rows at the camera one tile left (redrawing them)
; In:  8(a6) = this
; Out: d0
; Evidence: reached only after $65 taunts (Barbarian_StateTaunt); never runs in the corpus
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateScrollTiles:
	link.w	a6,#$0
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$8,d4
	move.w	g_CameraY(a5),d5
	asr.w	#$5,d5
	bra.s	loc_0BE53A
loc_0BE4D6:
	move.w	g_CameraX(a5),d6
	asr.w	#$5,d6
	ext.l	d5
	movea.l	g_FgRowTable(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	moveq	#$B,d7
	bra.s	loc_0BE52E
loc_0BE4FE:
	ext.l	d7
	move.l	d7,d0
	addq.l	#$1,d0
	add.l	d0,d0
	ext.l	d7
	move.l	d7,d1
	add.l	d1,d1
	move.w	(a4,d0.l),(a4,d1.l)
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FCA(a5)	; -> Map_RedrawBlock
	lea.l	$C(a7),a7
	move.w	d7,d0
	subq.w	#$1,d7
	move.w	d6,d0
	addq.w	#$1,d6
loc_0BE52E:
	tst.w	d7
	bne.s	loc_0BE4FE
	move.w	d4,d0
	subq.w	#$1,d4
	move.w	d5,d0
	addq.w	#$1,d5
loc_0BE53A:
	tst.w	d4
	bne.s	loc_0BE4D6
	move.w	#$3C,$6C(a3)
	lea.l	Barbarian_StateScrollTiles(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	movem.l	-$18(a6),d4-d7/a3-a4
	unlk	a6
	rts
