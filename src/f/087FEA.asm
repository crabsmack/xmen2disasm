; ---------------------------------------------------------------------------
; BroodBoss_StateFinish - BROODBOSS death: spawn a BROODCLAW off the right edge, flag the scene done, kill the boss
; In:  8(a6) = this
; Out: none
; Evidence: BroodClaw_Spawn(rec x = g_CameraX+$1E0, y $660, 1); byte g_SpawnEnabled := 1 (also cleared by CloneA5_RunScene); slot +$52 Kill; TAS 51132
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateFinish:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.w	g_CameraX(a5),d0
	add.w	#$1E0,d0
	move.w	d0,-$E(a6)
	move.w	#$660,-$C(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$10(a6)
	jsr	$1A42(a5)	; -> BroodClaw_Spawn
	move.b	#$1,g_SpawnEnabled(a5)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$14(a6),a4
	unlk	a6
	rts
