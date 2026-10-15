; ---------------------------------------------------------------------------
; BroodBoss_StateRecoilReturn - BROODBOSS state: return from the recoil, then the next step after 10 frames
; In:  8(a6) = this
; Out: none
; Evidence: +$8C and g_BroodBossOffsetX back down by 3/6 per frame to 0; next-step idiom
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateRecoilReturn:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d7
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0876D0
	lsl.w	#$1,d7
loc_0876D0:
	tst.w	$8C(a4)
	ble.s	loc_0876F8
	sub.w	d7,$8C(a4)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	sub.l	d0,g_BroodBossOffsetX(a5)
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateRecoilReturn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_08773E
loc_0876F8:
	clr.w	$8C(a4)
	tst.l	$92(a4)
	bne.s	loc_087710
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_08773E
loc_087710:
	addq.w	#$1,$90(a4)
	movea.l	$92(a4),a0
	move.w	$90(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_087724
	clr.w	$90(a4)
loc_087724:
	movea.l	$92(a4),a0
	addq.l	#$2,a0
	move.w	$90(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_08773E:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
