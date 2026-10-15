; ---------------------------------------------------------------------------
; Barbarian_StateWatchP2 - BARBARIAN state: engage if player 2 is on a reachable segment, else keep idling
; In:  8(a6) = this
; Out: d0
; Evidence: Barbarian_TargetPlayer($FFE9B8)
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateWatchP2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	Barbarian_TargetPlayer(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0BDB7A
	clr.w	$6C(a4)
	lea.l	Barbarian_StateEngage(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDB8C
loc_0BDB7A:
	clr.w	$6C(a4)
	lea.l	Barbarian_StateIdleTimer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDB8C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
