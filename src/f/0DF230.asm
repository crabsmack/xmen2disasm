; ---------------------------------------------------------------------------
; SentinelElevator_Init - parent Init, then no vertical speed, state SentinelElevator_StateStart (+$5C/+$64), flags |= $52A3, +$42 = 4, sprite def jt $25FA (palette 0), +$98/+$99 = 20; from the placement: switch +$90 (0-14) with flag word +$8C, travel top +$94 = y - 32 x (+8), bottom +$96 = y + 32 x (+$A); +$E = 99 makes it automatic (SentinelElevator_StateAuto, flag $1000 cleared); Obj_UpdateBoxes (SENTINELELEVATOR override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry or null
; Out: none
; Evidence: slot +$12 of the SENTINELELEVATOR descriptor $0DF556; TAS frames 4818-9969 (3 frames active)
; ---------------------------------------------------------------------------
SentinelElevator_Init:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$25F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$18(a4)
	clr.w	$20(a4)
	lea.l	SentinelElevator_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	SentinelElevator_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$52A3,$6(a4)
	move.b	#$4,$42(a4)
	lea.l	$25FA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$14,$98(a4)
	move.b	#$14,$99(a4)
	moveq	#$0,d0
	move.l	d0,$9A(a4)
	move.l	a3,d1
	lea.l	$10(a7),a7
	beq.w	loc_0DF336
	move.w	$6(a3),d7
	blt.s	loc_0DF2C2
	cmpi.w	#$F,d7
	blt.s	loc_0DF2C4
loc_0DF2C2:
	clr.w	d7
loc_0DF2C4:
	move.w	d7,$90(a4)
	ext.l	d7
	movea.l	g_SentinelsD1Flags(a5),a0
	move.l	d7,d0
	add.l	d0,d0
	adda.l	d0,a0
	move.l	a0,$8C(a4)
	move.w	$4(a3),$96(a4)
	move.w	$4(a3),$94(a4)
	move.w	$8(a3),d7
	beq.s	loc_0DF2FA
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	move.w	$4(a3),d1
	sub.w	d0,d1
	move.w	d1,$94(a4)
loc_0DF2FA:
	move.w	$A(a3),d7
	beq.s	loc_0DF310
	move.w	$A(a3),d0
	ext.l	d0
	lsl.l	#$5,d0
	add.w	$4(a3),d0
	move.w	d0,$96(a4)
loc_0DF310:
	moveq	#$63,d0
	cmp.w	$E(a3),d0
	bne.s	loc_0DF336
	lea.l	SentinelElevator_StateAuto(pc),a0
	move.l	a0,$5C(a4)
	lea.l	SentinelElevator_StateAuto(pc),a0
	move.l	a0,$64(a4)
	clr.b	$98(a4)
	clr.b	$42(a4)
	andi.w	#$EFFF,$6(a4)
loc_0DF336:
	clr.w	$92(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
