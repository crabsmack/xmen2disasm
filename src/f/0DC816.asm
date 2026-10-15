; ---------------------------------------------------------------------------
; Barrier_StateWatch - BARRIER state: once a player is level with it note which side they came from, and close when every live player has passed $40 px beyond it
; In:  8(a6) = this
; Out: d0
; Evidence: vertical range +$94..+$92, direction +$90 = +-1; then Barrier_Close and Barrier_StateIdle
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barrier_StateWatch:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d6
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.w	$4E(a3),d0
	ext.l	d0
	move.w	$52(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	move.w	$4C(a3),d0
	ext.l	d0
	move.w	$50(a3),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	asr.l	#$1,d5
	tst.w	$90(a4)
	addq.w	#$4,a7
	bne.s	loc_0DC878
	cmp.w	$94(a4),d5
	ble.s	loc_0DC878
	cmp.w	$92(a4),d5
	bge.s	loc_0DC878
	cmp.w	$10(a4),d7
	ble.s	loc_0DC872
	move.w	#$1,$90(a4)
	bra.s	loc_0DC878
loc_0DC872:
	move.w	#$FFFF,$90(a4)
loc_0DC878:
	tst.w	$90(a4)
	bne.s	loc_0DC894
	clr.w	$6C(a4)
	lea.l	Barrier_StateWatch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_0DC996
loc_0DC894:
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0DC8FC
	move.w	g_Player1+$4E(a5),d0
	ext.l	d0
	move.w	g_Player1+$52(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	move.w	g_Player1+$4C(a5),d0
	ext.l	d0
	move.w	g_Player1+$50(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	asr.l	#$1,d5
	tst.w	$90(a4)
	ble.s	loc_0DC8EA
	ext.l	d7
	move.w	$10(a4),d0
	ext.l	d0
	moveq	#$40,d1
	sub.l	d1,d0
	cmp.l	d7,d0
	bge.s	loc_0DC8FC
	clr.b	d6
	bra.s	loc_0DC8FC
loc_0DC8EA:
	ext.l	d7
	move.w	$10(a4),d0
	ext.l	d0
	moveq	#$40,d1
	add.l	d1,d0
	cmp.l	d7,d0
	ble.s	loc_0DC8FC
	clr.b	d6
loc_0DC8FC:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0DC964
	move.w	g_Player2+$4E(a5),d0
	ext.l	d0
	move.w	g_Player2+$52(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d7
	asr.l	#$1,d7
	move.w	g_Player2+$4C(a5),d0
	ext.l	d0
	move.w	g_Player2+$50(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,d5
	asr.l	#$1,d5
	tst.w	$90(a4)
	ble.s	loc_0DC952
	ext.l	d7
	move.w	$10(a4),d0
	ext.l	d0
	moveq	#$40,d1
	sub.l	d1,d0
	cmp.l	d7,d0
	bge.s	loc_0DC964
	clr.b	d6
	bra.s	loc_0DC964
loc_0DC952:
	ext.l	d7
	move.w	$10(a4),d0
	ext.l	d0
	moveq	#$40,d1
	add.l	d1,d0
	cmp.l	d7,d0
	ble.s	loc_0DC964
	clr.b	d6
loc_0DC964:
	tst.b	d6
	beq.s	loc_0DC984
	move.l	a4,-(a7)
	jsr	Barrier_Close(pc)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Barrier_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DC996
loc_0DC984:
	clr.w	$6C(a4)
	lea.l	Barrier_StateWatch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DC996:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
