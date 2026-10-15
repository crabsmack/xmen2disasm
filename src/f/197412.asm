; ---------------------------------------------------------------------------
; Wolverine_AirAttackDown - WOLVERINE slot +$BE: Down+B in the air: claw dive straight down (once per jump)
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: +$90 bit 2 clear: dive animation (jt $45BA data), sound $88, vy 0, gravity $B4, max fall $860, +$6E = 6, +$90 |= 2, state Wolverine_StateDiveHold
; ---------------------------------------------------------------------------
Wolverine_AirAttackDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	and.l	$90(a4),d0
	beq.s	loc_197438
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_197490
loc_197438:
	lea.l	$43BA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($88).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($88).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	$18(a4)
	move.w	#$B4,$20(a4)
	move.w	#$860,$24(a4)
	move.w	#$6,$6E(a4)
	ori.l	#$2,$90(a4)
	move.b	#$1,g_CamModeSwitched(a5)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	Wolverine_StateDiveHold(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_197490:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
