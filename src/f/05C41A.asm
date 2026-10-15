; ---------------------------------------------------------------------------
; Tusk_StateStartFight - TUSK: lock the camera around it, open the arena hook, start its music ($23), move players to layer 0
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: camera limits -$3A9C/-$3A98/-$3A96/-$3A9A from its home; Snd_StopAll, sound $23; next Tusk_StateChooseAttack after 100
; ---------------------------------------------------------------------------
Tusk_StateStartFight:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,d6
	sub.l	#$A0,d6
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d0,d7
	moveq	#$70,d0
	sub.l	d0,d7
	move.w	d6,d1
	sub.w	#$32,d1
	move.w	d1,-$3A98(a5)
	move.w	d6,d1
	add.w	#$32,d1
	move.w	d1,-$3A96(a5)
	move.w	d7,-$3A9C(a5)
	move.w	d7,-$3A9A(a5)
	move.l	a4,-(a7)
	jsr	Tusk_UnlockArena(pc)
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$23,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$23,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	g_Player1(a5)
	jsr	Tusk_PlayerToLayer0(pc)
	pea.l	g_Player2(a5)
	jsr	Tusk_PlayerToLayer0(pc)
	move.w	#$64,$6E(a4)
	lea.l	Tusk_StateChooseAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
