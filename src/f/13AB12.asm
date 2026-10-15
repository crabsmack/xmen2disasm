; ---------------------------------------------------------------------------
; Mine_PoolAdd - take a free mine record (max 20) and place it at a spawn position
; In:  8(a6) = position record (+2 word x, +4 word y)
; Out: d0 = record or 0 when the pool is full
; Evidence: pool + count*$26, count += 1, Mem_Set 0; +4/+6 = x/y, +$18 = Mine_StateStart; caller Mine_SpawnFromRec
; ---------------------------------------------------------------------------
Mine_PoolAdd:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	movea.l	d0,a4
	moveq	#$14,d1
	cmp.w	g_MinePoolCount(a5),d1
	ble.s	loc_13AB86
	move.w	g_MinePoolCount(a5),d0
	ext.l	d0
	movea.l	g_MinePool(a5),a0
	move.l	d0,d1
	mulu.w	#$26,d0
	swap	d1
	mulu.w	#$26,d1
	swap	d1
	clr.w	d1
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
	move.w	g_MinePoolCount(a5),d0
	addq.w	#$1,g_MinePoolCount(a5)
	moveq	#$26,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.w	$2(a3),$4(a4)
	move.w	$4(a3),$6(a4)
	lea.l	Mine_StateStart(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
	moveq	#$0,d0
	move.l	d0,$20(a4)
	clr.w	$24(a4)
	lea.l	$C(a7),a7
loc_13AB86:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
