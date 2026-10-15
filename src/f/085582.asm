; ---------------------------------------------------------------------------
; Teleporter_StateWait - TELEPORTER state: wait for a player to step onto the pad (box within 10 px), then teleport
; In:  8(a6) = this
; Out: d0
; Evidence: keeps waiting while any live player has sub_1F429E(player) true; else a live player whose box overlaps +-10 px of the pad and lacks +4 bit $1000 -> +6 bit $1000, state Teleporter_StateTeleport; TAS 48266-48388
; Found: link-after-rts
; ---------------------------------------------------------------------------
Teleporter_StateWait:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	moveq	#$A,d0
	sub.l	d0,d5
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.l	d1,d6
	sub.l	d0,d6
	ext.l	d5
	move.l	d5,d1
	moveq	#$14,d2
	add.l	d2,d1
	move.w	d1,-$2(a6)
	ext.l	d6
	move.l	d6,d4
	add.l	d2,d4
	moveq	#$0,d7
loc_0855B8:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_0855C8
	lea.l	g_Player1(a5),a3
	move.l	a3,d0
	bra.s	loc_0855CE
loc_0855C8:
	lea.l	g_Player2(a5),a3
	move.l	a3,d0
loc_0855CE:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_08560A
	move.l	a3,-(a7)
	jsr	$4D72(a5)	; -> sub_1F429E
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_08560A
	clr.w	$6C(a4)
	lea.l	Teleporter_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_08568C
loc_08560A:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_0855B8
	moveq	#$0,d7
loc_085614:
	tst.l	d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_085624
	lea.l	g_Player1(a5),a3
	move.l	a3,d0
	bra.s	loc_08562A
loc_085624:
	lea.l	g_Player2(a5),a3
	move.l	a3,d0
loc_08562A:
	movea.l	d0,a0
	move.w	$4(a0),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_085684
	cmp.w	$52(a3),d5
	bgt.s	loc_085684
	move.w	-$2(a6),d0
	cmp.w	$4E(a3),d0
	blt.s	loc_085684
	cmp.w	$50(a3),d6
	bgt.s	loc_085684
	cmp.w	$4C(a3),d4
	blt.s	loc_085684
	move.w	#$1000,d0
	and.w	$4(a3),d0
	bne.s	loc_085684
	ori.w	#$1000,$6(a4)
	clr.w	$6C(a4)
	lea.l	Teleporter_StateTeleport(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08568C
loc_085684:
	addq.l	#$1,d7
	moveq	#$2,d0
	cmp.l	d7,d0
	bgt.s	loc_085614
loc_08568C:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
