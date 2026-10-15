; ---------------------------------------------------------------------------
; BroodBoss_StateHitWall - BROODBOSS state: smash the wall - frame $F, debris, recoil
; In:  8(a6) = this
; Out: d0
; Evidence: wall +$43 = 1 (BroodBossWall_Update explodes it), +$A2 = 0, BroodBoss_SpawnDebris, -$3B0C |= $40, +$8E += 10; next BroodBoss_StateRecoil; TAS 50482
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateHitWall:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	beq.s	loc_087620
	movea.l	$A2(a4),a0
	move.b	#$1,$43(a0)
	moveq	#$0,d0
	move.l	d0,$A2(a4)
loc_087620:
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	BroodBoss_SpawnDebris(pc)
	ori.w	#$40,g_SceneVar3B0C(a5)
	addi.w	#$A,$8E(a4)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRecoil(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
