; ---------------------------------------------------------------------------
; Tusk_StateWaitP1Platform - TUSK: P2 is on the platform, wait for P1
; In:  8(a6) = this
; Out: d0
; Evidence: next Tusk_StateStartFight
; ---------------------------------------------------------------------------
Tusk_StateWaitP1Platform:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	Tusk_PlayerOnPlatform(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05C3E6
	lea.l	Tusk_StateStartFight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C3E6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
