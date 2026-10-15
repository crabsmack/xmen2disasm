; ---------------------------------------------------------------------------
; PlayerSelect_Run_SetP2 - PlayerSelect_Run: P1 absent (clear g_Player1), then apply P2's choice from its cursor
; In:  none
; Out: none
; Evidence: g_P1CharIndex = $FF; g_P2CharIndex = cursor -$3B2C +$3C, health $700 if new; switch Sw_065CBC
; ---------------------------------------------------------------------------
PlayerSelect_Run_SetP2:
	moveq	#$0,d0
	move.l	d0,g_Player1(a5)
	clr.w	-$1754(a5)
	dc.w	$1B7C,$FFFF,$C444	; insn: move.b #$ff, -$3bbc(a5)
	movea.l	-$3B2C(a5),a0
	move.b	g_P2CharIndex(a5),d0
	cmp.b	$3C(a0),d0
	beq.s	loc_065CF2
	moveq	#-$1,d0
	cmp.b	g_P2CharIndex(a5),d0
	bne.s	loc_065CE8
	move.w	#$700,g_P2Health(a5)
loc_065CE8:
	movea.l	-$3B2C(a5),a0
	move.b	$3C(a0),g_P2CharIndex(a5)
loc_065CF2:
	move.w	#$C000,-$1844(a5)
	move.b	g_P2CharIndex(a5),d0
	bmi.s	PlayerSelect_Run_P2None
	cmpi.b	#$6,d0
	bgt.s	PlayerSelect_Run_P2None
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_065CBC(pc,d1.w),d1
	jmp	Sw_065CBC-2(pc,d1.w)
