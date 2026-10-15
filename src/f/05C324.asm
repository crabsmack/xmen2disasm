; ---------------------------------------------------------------------------
; Tusk_StateBoulderRain - TUSK pre-fight: keep boulders falling until the players stand on its platform (both if both are present), then start the fight
; In:  8(a6) = this
; Out: d0
; Evidence: Boulder_SpawnerTick(y), Boulder_UpdateDebris; Tusk_PlayerOnPlatform; next Tusk_StateWaitP1Platform / Tusk_StateWaitP2Platform / Tusk_StateStartFight
; ---------------------------------------------------------------------------
Tusk_StateBoulderRain:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),-(a7)
	jsr	$CBA(a5)	; -> Boulder_SpawnerTick
	jsr	$CC2(a5)	; -> Boulder_UpdateDebris
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	Tusk_PlayerOnPlatform(pc)
	tst.b	d0
	lea.l	$C(a7),a7
	beq.s	loc_05C37C
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C370
	lea.l	Tusk_StateWaitP2Platform(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C370:
	lea.l	Tusk_StateStartFight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C37C:
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	Tusk_PlayerOnPlatform(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_05C3BA
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C3B0
	lea.l	Tusk_StateWaitP1Platform(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_05C3BA
loc_05C3B0:
	lea.l	Tusk_StateStartFight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
loc_05C3BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
