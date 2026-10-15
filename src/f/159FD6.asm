; ---------------------------------------------------------------------------
; Pal_CycleStep - palette cycling: count down and write the next colour of the current sequence into g_PalBase
; In:  8(a6) = word ptr: timer   $C(a6) = word ptr: colour index   $10(a6) = word ptr: sequence index   $14(a6) = cycle table   $18(a6) = byte: keep the new state
; Out: none
; Evidence: table of 6-byte sequences {long offset to colour words (end -1), byte delay, byte palette entry}, list ends with offset -1; on expiry g_PalBase[entry] = colour, g_PalBaseDirty = 1; double speed when byte -$38DE ($FFC922) is set; state restored when the keep flag is 0
; ---------------------------------------------------------------------------
Pal_CycleStep:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	move.b	$1(a0),d5
	movea.l	$10(a6),a0
	move.b	$1(a0),d6
	movea.l	$C(a6),a0
	move.b	$1(a0),d7
	movea.l	$8(a6),a0
	subq.w	#$1,(a0)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_15A008
	movea.l	$8(a6),a0
	subq.w	#$1,(a0)
loc_15A008:
	movea.l	$8(a6),a0
	tst.w	(a0)
	bgt.s	loc_15A084
	movea.l	$10(a6),a0
	move.w	(a0),d0
	ext.l	d0
	add.l	d0,d0
	move.l	d0,d1
	add.l	d1,d1
	add.l	d1,d0
	movea.l	d0,a4
	adda.l	$14(a6),a4
	move.l	(a4),d0
	add.l	$14(a6),d0
	movea.l	$C(a6),a0
	move.w	(a0),d1
	ext.l	d1
	add.l	d1,d1
	movea.l	d1,a3
	adda.l	d0,a3
	move.b	$5(a4),d0
	ext.w	d0
	add.w	d0,d0
	lea.l	g_PalBase(a5),a0
	move.w	(a3),(a0,d0.w)
	move.b	#$1,g_PalBaseDirty(a5)
	move.b	$4(a4),d0
	ext.w	d0
	movea.l	$8(a6),a0
	move.w	d0,(a0)
	movea.l	$C(a6),a0
	addq.w	#$1,(a0)
	addq.w	#$2,a3
	moveq	#-$1,d0
	cmp.w	(a3),d0
	bne.s	loc_15A084
	movea.l	$C(a6),a0
	clr.w	(a0)
	movea.l	$10(a6),a0
	addq.w	#$1,(a0)
	addq.w	#$6,a4
	moveq	#-$1,d0
	cmp.l	(a4),d0
	bne.s	loc_15A084
	movea.l	$10(a6),a0
	clr.w	(a0)
loc_15A084:
	tst.b	$1B(a6)
	bne.s	loc_15A0A2
	ext.w	d5
	movea.l	$8(a6),a0
	move.w	d5,(a0)
	ext.w	d6
	movea.l	$10(a6),a0
	move.w	d6,(a0)
	ext.w	d7
	movea.l	$C(a6),a0
	move.w	d7,(a0)
loc_15A0A2:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
