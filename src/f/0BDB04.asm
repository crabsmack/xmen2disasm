; ---------------------------------------------------------------------------
; Barbarian_StateWatchP1 - BARBARIAN state: engage if player 1 is on a reachable segment, else check player 2
; In:  8(a6) = this
; Out: d0
; Evidence: Barbarian_TargetPlayer($FFEAA8); TAS 27995-33090
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateWatchP1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	Barbarian_TargetPlayer(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0BDB32
	clr.w	$6C(a4)
	lea.l	Barbarian_StateEngage(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDB44
loc_0BDB32:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWatchP2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDB44:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
