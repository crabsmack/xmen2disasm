; ---------------------------------------------------------------------------
; Exodus_HurtOnHotTiles - hurt an object standing on the energised floor tiles (tile ids g_FgBlockCount..+3) below y $304
; In:  8(a6) = object
; Out: none
; Evidence: present, y px > $304, hit cooldown +$6A == 0, map tile under its feet in range -> slot $26 TakeDamage(0, 4, 1, -1, -1)
; ---------------------------------------------------------------------------
Exodus_HurtOnHotTiles:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_02DA0C
	cmpi.w	#$304,$50(a4)
	ble.s	loc_02DA0C
	tst.w	$6A(a4)
	bne.s	loc_02DA0C
	moveq	#$D,d0
	move.l	$8(a4),d5
	asr.l	d0,d5
	move.l	$C(a4),d0
	sub.l	#$C00,d0
	moveq	#$D,d1
	move.l	d0,d6
	asr.l	d1,d6
	ext.l	d6
	movea.l	g_FgRowTable(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d5
	add.l	d5,d0
	movea.l	g_FgBlockMap(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d7
	and.w	(a0,d0.l),d7
	cmp.w	g_FgBlockCount(a5),d7
	blt.s	loc_02DA0C
	ext.l	d7
	move.w	g_FgBlockCount(a5),d0
	ext.l	d0
	addq.l	#$4,d0
	cmp.l	d7,d0
	ble.s	loc_02DA0C
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
loc_02DA0C:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
