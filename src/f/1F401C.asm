; ---------------------------------------------------------------------------
; XClimber_CheckGrab_Default - XClimber_CheckGrab switch default: clear the grab timer +$A6 and run the common grab tests
; In:  a4 = player
; Out: d0 = 1 grab / 0
; Evidence: switch-table default target inside XClimber_CheckGrab
; ---------------------------------------------------------------------------
XClimber_CheckGrab_Default:
	clr.w	$A6(a4)
loc_1F4020:
	tst.w	$A6(a4)
	ble.w	loc_1F412A
	tst.w	$A8(a4)
	ble.w	loc_1F412A
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#$C,d1
	and.w	d0,d1
	move.w	d1,d7
	lsr.w	#$2,d7
	move.l	#$3C000,d5
	and.l	$90(a4),d5
	move.l	$C(a4),d6
	asr.l	#$8,d6
	move.l	#$10000,d0
	and.l	d5,d0
	beq.s	loc_1F4064
	cmp.w	$9A(a4),d6
	bge.s	loc_1F4064
	moveq	#$0,d0
	bra.w	loc_1F412C
loc_1F4064:
	move.l	#$20000,d0
	and.l	d5,d0
	beq.s	loc_1F407A
	cmp.w	$9A(a4),d6
	ble.s	loc_1F407A
	moveq	#$0,d0
	bra.w	loc_1F412C
loc_1F407A:
	cmpi.w	#$2,d7
	beq.s	loc_1F4086
	cmpi.w	#$3,d7
	bne.s	loc_1F40F4
loc_1F4086:
	movea.l	$BC(a4),a3
	move.l	a3,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Player_TopAboveSeg(pc)
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1F40F0
	move.l	a3,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Player_BottomBelowSeg(pc)
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1F40F0
	tst.w	$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_1F40C4
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_1F40CC
loc_1F40C4:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_1F40CC:
	cmpi.l	#$1050,d0
	bge.s	loc_1F40F0
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	moveq	#$1,d0
	bra.s	loc_1F412C
loc_1F40F0:
	moveq	#$0,d0
	bra.s	loc_1F412C
loc_1F40F4:
	move.l	$BC(a4),-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Player_FrontPastSeg(pc)
	tst.b	d0
	lea.l	$C(a7),a7
	bne.s	loc_1F4126
	moveq	#$0,d0
	move.w	$C0(a4),d0
	moveq	#-$4,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	ext.l	d7
	move.l	d7,d1
	or.l	d0,d1
	move.w	d1,$C0(a4)
	moveq	#$1,d0
	bra.s	loc_1F412C
loc_1F4126:
	moveq	#$0,d0
	bra.s	loc_1F412C
loc_1F412A:
	moveq	#$0,d0
loc_1F412C:
	movem.l	-$18(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
