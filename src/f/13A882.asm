; ---------------------------------------------------------------------------
; Mine_PoolRemove - remove a mine record from the pool by copying the last record over it
; In:  8(a6) = record
; Out: d0 = misc
; Evidence: count $FFE788 -= 1; Mem_Copy(record, pool + count*$26, $26) when records remain; callers Mine_PoolUpdate (dead or off-screen records)
; ---------------------------------------------------------------------------
Mine_PoolRemove:
	link.w	a6,#$0
	move.w	g_MinePoolCount(a5),d0
	subq.w	#$1,g_MinePoolCount(a5)
	tst.w	g_MinePoolCount(a5)
	ble.s	loc_13A8C0
	moveq	#$26,d0
	move.l	d0,-(a7)
	move.w	g_MinePoolCount(a5),d1
	ext.l	d1
	movea.l	g_MinePool(a5),a0
	move.l	d1,d2
	mulu.w	#$26,d1
	swap	d2
	mulu.w	#$26,d2
	swap	d2
	clr.w	d2
	add.l	d2,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
loc_13A8C0:
	unlk	a6
	rts
