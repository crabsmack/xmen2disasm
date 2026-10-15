; ---------------------------------------------------------------------------
; Beast_SetAirFrame - BEAST slot +$7E: pick the jump frame from the vertical speed
; In:  8(a6) = player
; Out: none
; Evidence: vy bands -$5A6/-$2A0/$2A0/$300 -> SetFrame 9/$B/$D/$B/$E; frame $C during the ledge slowdown +$AA
; ---------------------------------------------------------------------------
Beast_SetAirFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	tst.w	$AA(a4)
	ble.s	loc_182B64
	moveq	#$C,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_182BD4
loc_182B64:
	cmpi.w	#$FA5A,d7
	bge.s	loc_182B7C
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_182BD4
loc_182B7C:
	cmpi.w	#$FD60,d7
	bge.s	loc_182B94
	moveq	#$B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_182BD4
loc_182B94:
	cmpi.w	#$2A0,d7
	bge.s	loc_182BAC
	moveq	#$D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_182BD4
loc_182BAC:
	cmpi.w	#$300,d7
	bge.s	loc_182BC4
	moveq	#$B,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_182BD4
loc_182BC4:
	moveq	#$E,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_182BD4:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
