; ---------------------------------------------------------------------------
; BroodBoss_StateRecoil - BROODBOSS state: recoil - push the part offset +$8C and the boss offset out by 3 (6 with g_TwoPlayerStep) per frame up to 10
; In:  8(a6) = this
; Out: d0
; Evidence: -$3C44 += step << 8; next BroodBoss_StateRecoilReturn
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateRecoil:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d7
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_087674
	lsl.w	#$1,d7
loc_087674:
	moveq	#$A,d0
	cmp.w	$8C(a4),d0
	ble.s	loc_08769E
	add.w	d7,$8C(a4)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,g_BroodBossOffsetX(a5)
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRecoil(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0876B0
loc_08769E:
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRecoilReturn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0876B0:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
