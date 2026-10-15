; ---------------------------------------------------------------------------
; Seg_Free - free a floor-segment record and unlink it from its neighbours
; In:  8(a6) = segment record
; Out: none
; Evidence: neighbour indexes +$10 (previous) / +$11 (next): their back/forward links set to $FF; +0 cleared; 13 callers (actor despawn code, e.g. SentinelDoor_Despawn)
; ---------------------------------------------------------------------------
Seg_Free:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$10(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F7D2E
	moveq	#$0,d0
	move.b	$10(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	move.b	#$FF,$11(a0,d0.w)
loc_1F7D2E:
	moveq	#$0,d0
	move.b	$11(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F7D54
	moveq	#$0,d0
	move.b	$11(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	move.b	#$FF,$10(a0,d0.w)
loc_1F7D54:
	clr.b	(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
