; ---------------------------------------------------------------------------
; SentinelElevator_StateSinking - SENTINELELEVATOR state: sink to the bottom (+$96), then wait for the switch, go up at once or after +$99 frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelElevator_StateSinking:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$96(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	cmp.l	$C(a4),d7
	bge.s	loc_0DF54C
	move.l	d7,$C(a4)
	ori.w	#$4000,$6(a4)
	tst.b	$99(a4)
	beq.s	loc_0DF53A
	moveq	#$0,d0
	move.b	$99(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_0DF520
	lea.l	SentinelElevator_StateGoUp(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	SentinelElevator_StateGoUp(pc)
	addq.w	#$4,a7
	bra.s	loc_0DF54C
loc_0DF520:
	moveq	#$0,d0
	move.b	$99(a4),d0
	move.w	d0,$6C(a4)
	lea.l	SentinelElevator_StateGoUp(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DF54C
loc_0DF53A:
	clr.w	$6C(a4)
	lea.l	SentinelElevator_StateWaitSwitch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DF54C:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
