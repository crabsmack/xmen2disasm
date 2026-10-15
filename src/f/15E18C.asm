; ---------------------------------------------------------------------------
; Actor_OutsideActiveWindow - ACTOR slot +$42: test whether an unattached object has left the active window
; In:  8(a6) = object
; Out: d0 = 1 outside, else 0
; Evidence: only unattached objects without flag $1000 (or with health +$68 < 1); screen x vs $FFCC3E/$FFCC40, y vs $FFCC3A/$FFCC3C, flags $800/$20 skip an axis
; ---------------------------------------------------------------------------
Actor_OutsideActiveWindow:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_15E1A8
	moveq	#$0,d0
	bra.s	loc_15E218
loc_15E1A8:
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_15E1BC
	tst.w	$68(a4)
	ble.s	loc_15E1BC
	moveq	#$0,d0
	bra.s	loc_15E218
loc_15E1BC:
	move.w	#$800,d0
	and.w	$6(a4),d0
	bne.s	loc_15E1EA
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	g_DeactWinRight(a5),d7
	ble.s	loc_15E1E0
	moveq	#$1,d0
	bra.s	loc_15E218
loc_15E1E0:
	cmp.w	g_DeactWinLeft(a5),d7
	bge.s	loc_15E1EA
	moveq	#$1,d0
	bra.s	loc_15E218
loc_15E1EA:
	moveq	#$20,d0
	and.w	$6(a4),d0
	bne.s	loc_15E216
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmp.w	g_DeactWinBottom(a5),d7
	ble.s	loc_15E20C
	moveq	#$1,d0
	bra.s	loc_15E218
loc_15E20C:
	cmp.w	g_DeactWinTop(a5),d7
	bge.s	loc_15E216
	moveq	#$1,d0
	bra.s	loc_15E218
loc_15E216:
	moveq	#$0,d0
loc_15E218:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
