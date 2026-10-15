; ---------------------------------------------------------------------------
; SentinelElevator_StateRising - SENTINELELEVATOR state: rise to the top (+$94), then wait for the switch (wait 0), go down at once ($FF) or after +$98 frames
; In:  8(a6) = this
; Out: d0
; Evidence: TAS 4822-5350
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelElevator_StateRising:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$94(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	cmp.l	$C(a4),d7
	ble.s	loc_0DF49C
	move.l	d7,$C(a4)
	ori.w	#$4000,$6(a4)
	tst.b	$98(a4)
	beq.s	loc_0DF48A
	moveq	#$0,d0
	move.b	$98(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_0DF470
	lea.l	SentinelElevator_StateGoDown(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	SentinelElevator_StateGoDown(pc)
	addq.w	#$4,a7
	bra.s	loc_0DF49C
loc_0DF470:
	moveq	#$0,d0
	move.b	$98(a4),d0
	move.w	d0,$6C(a4)
	lea.l	SentinelElevator_StateGoDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DF49C
loc_0DF48A:
	clr.w	$6C(a4)
	lea.l	SentinelElevator_StateWaitSwitch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DF49C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
