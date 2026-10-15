; ---------------------------------------------------------------------------
; BroodBoss_StateSetup - BROODBOSS first state: create its claw, arm and little leg, then start the entrance
; In:  8(a6) = this
; Out: d0
; Evidence: SetFrame($FF); BroodClaw_Spawn(rec x+$11 y $660, 1) BROODCLAW -> +$96 (state BroodClaw_StateIdle); BROODBOSSARM New at (x+$31, y-$C) -> +$9A; LITTLELEG +$0A at (x+$6A, y-$24) -> +$9E; next BroodBoss_StateRoar; TAS 49291
; ---------------------------------------------------------------------------
BroodBoss_StateSetup:
	link.w	a6,#$FFF0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	$10(a4),d7
	add.w	#$FFE0,d7
	move.w	$12(a4),d6
	add.w	#$5B,d6
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.w	d7,d0
	add.w	#$31,d0
	move.w	d0,-$E(a6)
	move.w	#$660,-$C(a6)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$10(a6)
	jsr	$1A42(a5)	; -> BroodClaw_Spawn
	move.l	d0,$96(a4)
	lea.l	$1C(a7),a7
	beq.s	loc_086B42
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	lea.l	$1A72(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$5C(a1)
loc_086B42:
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$10(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.w	$10(a4),d0
	add.w	#$31,d0
	move.w	d0,-$E(a6)
	move.w	$12(a4),d0
	add.w	#$FFF4,d0
	move.w	d0,-$C(a6)
	pea.l	-$10(a6)
	move.w	-$C(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	-$E(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	lea.l	$14FA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$14FA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	move.l	d0,$9A(a4)
	lea.l	$153A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$2,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	d7,d5
	add.w	#$8A,d5
	move.w	d6,d7
	add.w	#$FF81,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$14EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,$9E(a4)
	lea.l	$2C(a7),a7
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRoar(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$20(a6),d5-d7/a4
	unlk	a6
	rts
