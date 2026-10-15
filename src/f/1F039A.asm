; ---------------------------------------------------------------------------
; XPlayer_StateDeathBlink - player death: blink the body faster each cycle, finish after 10 cycles
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: alternates SetFrame(char +$28) and SetFrame($FF) with on-time +$10 growing every 20 frames; > 9 -> XPlayer_DeathDone
; ---------------------------------------------------------------------------
XPlayer_StateDeathBlink:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_1F0406
	tst.w	$A6(a4)
	bgt.s	loc_1F03D4
	addq.w	#$1,$10(a4)
	move.w	#$14,$A6(a4)
	moveq	#$A,d0
	cmp.w	$10(a4),d0
	bgt.s	loc_1F03D4
	lea.l	XPlayer_DeathDone(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	XPlayer_DeathDone(pc)
	addq.w	#$4,a7
	bra.s	loc_1F0428
loc_1F03D4:
	movea.l	$8C(a4),a0
	moveq	#$0,d0
	move.b	$28(a0),d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	$10(a4),$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	XPlayer_StateDeathBlink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1F0428
loc_1F0406:
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	XPlayer_StateDeathBlink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1F0428:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
