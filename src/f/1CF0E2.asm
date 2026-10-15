; ---------------------------------------------------------------------------
; Gambit_CardCollide - test a moving card against enemy bodies and the map: hit an enemy, or back out of a wall and explode
; In:  8(a6) = card record {+0 x, +4 y (16.16 >>8), +8 vx, +$A vy}
; Out: d0 = 1 when the card hit something (caller frees it), 0 otherwise
; Evidence: ObjList_ForEachAtPoint(x, y, g_HitListEnemyBody, Gambit_CardHitEnemy); else map test Tile_TestAt(0, x, y, ..., $7800, 1): step back by v/4 until clear, Explosion_Spawn there
; ---------------------------------------------------------------------------
Gambit_CardCollide:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	(a4),d6
	move.l	$4(a4),d7
	move.l	d6,d5
	asr.l	#$8,d5
	move.l	d7,d4
	asr.l	#$8,d4
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	Gambit_CardHitEnemy(pc)
	move.l	g_HitListEnemyBody(a5),-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$4FFA(a5)	; -> ObjList_ForEachAtPoint
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1CF124
	moveq	#$1,d0
	bra.w	loc_1CF1AC
loc_1CF124:
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	g_SolidMapIsBg(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1CF1AA
	move.w	$8(a4),d4
	asr.w	#$2,d4
	move.w	$A(a4),d5
	asr.w	#$2,d5
loc_1CF15E:
	ext.l	d4
	sub.l	d4,d6
	ext.l	d5
	sub.l	d5,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($7800).w
	tst.b	g_SolidMapIsBg(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.l	d7,d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d6,d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$18(a7),a7
	bne.s	loc_1CF15E
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$1,d0
	lea.l	$C(a7),a7
	bra.s	loc_1CF1AC
loc_1CF1AA:
	moveq	#$0,d0
loc_1CF1AC:
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
