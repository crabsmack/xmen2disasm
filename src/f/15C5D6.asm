; ---------------------------------------------------------------------------
; loc_15C5D6
; ---------------------------------------------------------------------------
loc_15C5D6:
	clr.w	-$3C58(a5)
	moveq	#$0,d0
	move.l	d0,-$1666(a5)
	bra.w	loc_15CA36
loc_15C5E4:
	clr.w	-$3C58(a5)
	moveq	#$0,d0
	move.l	d0,-$1666(a5)
	bra.w	loc_15CA36
loc_15C5F2:
	moveq	#$7F,d6
	and.w	g_Pad1Latch(a5),d6
	tst.w	d6
	beq.w	loc_15CA36
	cmpi.w	#$21,d6
	bne.s	loc_15C666
	moveq	#$10,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_15C63C
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	-$16F0(a5)
	addq.w	#$8,a7
	ble.s	loc_15C62A
	move.w	#$900,-$16F0(a5)
loc_15C62A:
	tst.w	-$17E0(a5)
	ble.w	loc_15CA36
	move.w	#$900,-$17E0(a5)
	bra.w	loc_15CA36
loc_15C63C:
	move.w	#$1,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C658
	lea.l	$E0A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C658:
	lea.l	$E3A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C666:
	cmpi.w	#$22,d6
	bne.s	loc_15C6A0
	moveq	#$20,d0
	and.w	-$3C5E(a5),d0
	bne.w	loc_15CA36
	move.w	#$2,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C692
	lea.l	$E12(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C692:
	lea.l	$E42(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C6A0:
	cmpi.w	#$24,d6
	bne.s	loc_15C6F2
	moveq	#$40,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_15C6C8
	subq.w	#$1,g_SceneIndex(a5)
	move.b	#$1,-$1662(a5)
	move.b	#$1,-$38C2(a5)
	move.w	#$1,g_SceneExitTimer(a5)
	bra.w	loc_15CA36
loc_15C6C8:
	move.w	#$3,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C6E4
	lea.l	$E1A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C6E4:
	lea.l	$E4A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C6F2:
	cmpi.w	#$28,d6
	bne.s	loc_15C740
	move.w	#$80,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_15C716
	addq.w	#$1,g_SceneIndex(a5)
	move.b	#$1,-$1662(a5)
	move.w	#$1,g_SceneExitTimer(a5)
	bra.w	loc_15CA36
loc_15C716:
	move.w	#$3,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C732
	lea.l	$E1A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C732:
	lea.l	$E4A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C740:
	cmpi.w	#$12,d6
	bne.w	loc_15C7CA
	move.w	#$100,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_15C7A0
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	addq.w	#$8,a7
	bne.w	loc_15CA36
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.w	loc_15CA36
	jsr	$3A(a5)	; -> unk_Player_005F18
	bra.w	loc_15CA36
loc_15C7A0:
	move.w	#$5,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C7BC
	lea.l	$E22(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C7BC:
	lea.l	$E52(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C7CA:
	cmpi.w	#$14,d6
	bne.w	loc_15C8D8
	move.w	#$400,d0
	and.w	-$3C5E(a5),d0
	beq.w	loc_15C8AE
	clr.w	d7
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	d7
	addq.w	#$8,a7
	bne.s	loc_15C80C
	moveq	#$0,d0
	move.b	g_ScnCerebroClone(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C80C
	moveq	#$0,d7
	move.b	g_ScnCerebroClone(a5),d7
	tst.l	d7
loc_15C80C:
	tst.w	d7
	bne.s	loc_15C826
	moveq	#$0,d0
	move.b	g_ScnCerebroSpace(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C826
	moveq	#$0,d7
	move.b	g_ScnCerebroSpace(a5),d7
	tst.l	d7
loc_15C826:
	tst.w	d7
	bne.s	loc_15C840
	moveq	#$0,d0
	move.b	g_ScnCerebroSavage(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C840
	moveq	#$0,d7
	move.b	g_ScnCerebroSavage(a5),d7
	tst.l	d7
loc_15C840:
	tst.w	d7
	bne.s	loc_15C85A
	moveq	#$0,d0
	move.b	g_ScnCerebroBaniMaza(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C85A
	moveq	#$0,d7
	move.b	g_ScnCerebroBaniMaza(a5),d7
	tst.l	d7
loc_15C85A:
	tst.w	d7
	bne.s	loc_15C874
	moveq	#$0,d0
	move.b	g_ScnCerebroAvalon(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C874
	moveq	#$0,d7
	move.b	g_ScnCerebroAvalon(a5),d7
	tst.l	d7
loc_15C874:
	tst.w	d7
	bne.s	loc_15C88E
	moveq	#$0,d0
	move.b	g_ScnCerebroSentinels(a5),d0
	addq.w	#$1,d0
	cmp.w	g_SceneIndex(a5),d0
	bge.s	loc_15C88E
	moveq	#$0,d7
	move.b	g_ScnCerebroSentinels(a5),d7
	tst.l	d7
loc_15C88E:
	tst.w	d7
	beq.w	loc_15CA36
	move.w	d7,g_SceneIndex(a5)
	move.b	#$1,-$1662(a5)
	move.w	#$1,g_SceneExitTimer(a5)
	move.b	#$1,-$38C2(a5)
	bra.w	loc_15CA36
loc_15C8AE:
	move.w	#$7,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C8CA
	lea.l	$E2A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C8CA:
	lea.l	$E5A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.w	loc_15CA36
loc_15C8D8:
	cmpi.w	#$18,d6
	bne.w	loc_15C9D6
	move.w	#$400,d0
	and.w	-$3C5E(a5),d0
	beq.w	loc_15C9B0
	clr.w	d7
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$26,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	d7
	addq.w	#$8,a7
	bne.s	loc_15C918
	moveq	#$0,d0
	move.b	g_ScnCerebroSentinels(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C918
	moveq	#$0,d7
	move.b	g_ScnCerebroSentinels(a5),d7
	tst.l	d7
loc_15C918:
	tst.w	d7
	bne.s	loc_15C930
	moveq	#$0,d0
	move.b	g_ScnCerebroAvalon(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C930
	moveq	#$0,d7
	move.b	g_ScnCerebroAvalon(a5),d7
	tst.l	d7
loc_15C930:
	tst.w	d7
	bne.s	loc_15C948
	moveq	#$0,d0
	move.b	g_ScnCerebroBaniMaza(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C948
	moveq	#$0,d7
	move.b	g_ScnCerebroBaniMaza(a5),d7
	tst.l	d7
loc_15C948:
	tst.w	d7
	bne.s	loc_15C960
	moveq	#$0,d0
	move.b	g_ScnCerebroSavage(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C960
	moveq	#$0,d7
	move.b	g_ScnCerebroSavage(a5),d7
	tst.l	d7
loc_15C960:
	tst.w	d7
	bne.s	loc_15C978
	moveq	#$0,d0
	move.b	g_ScnCerebroSpace(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C978
	moveq	#$0,d7
	move.b	g_ScnCerebroSpace(a5),d7
	tst.l	d7
loc_15C978:
	tst.w	d7
	bne.s	loc_15C990
	moveq	#$0,d0
	move.b	g_ScnCerebroClone(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	ble.s	loc_15C990
	moveq	#$0,d7
	move.b	g_ScnCerebroClone(a5),d7
	tst.l	d7
loc_15C990:
	tst.w	d7
	beq.w	loc_15CA36
	move.w	d7,g_SceneIndex(a5)
	move.b	#$1,-$1662(a5)
	move.w	#$1,g_SceneExitTimer(a5)
	move.b	#$1,-$38C2(a5)
	bra.w	loc_15CA36
loc_15C9B0:
	move.w	#$7,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15C9CA
	lea.l	$E2A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.s	loc_15CA36
loc_15C9CA:
	lea.l	$E5A(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.s	loc_15CA36
loc_15C9D6:
	cmpi.w	#$11,d6
	bne.s	loc_15CA36
	move.w	#$200,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_15CA12
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$24,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	tst.w	-$16F0(a5)
	addq.w	#$8,a7
	ble.s	loc_15CA04
	move.w	#$7FFF,-$16F0(a5)
loc_15CA04:
	tst.w	-$17E0(a5)
	ble.s	loc_15CA36
	move.w	#$7FFF,-$17E0(a5)
	bra.s	loc_15CA36
loc_15CA12:
	move.w	#$8,-$3C58(a5)
	moveq	#$C,d0
	cmp.w	g_Pad2Raw(a5),d0
	bne.s	loc_15CA2C
	lea.l	$E32(a5),a0
	move.l	$2(a0),-$1666(a5)
	bra.s	loc_15CA36
loc_15CA2C:
	lea.l	$E62(a5),a0
	move.l	$2(a0),-$1666(a5)
loc_15CA36:
	tst.w	-$16F0(a5)
	ble.s	loc_15CA4C
	move.w	#$80,d0
	and.w	g_Pad1Latch(a5),d0
	beq.s	loc_15CA4C
	move.b	#$1,-$1662(a5)
loc_15CA4C:
	tst.w	-$17E0(a5)
	ble.s	loc_15CA62
	move.w	#$80,d0
	and.w	g_Pad2Latch(a5),d0
	beq.s	loc_15CA62
	move.b	#$1,-$1662(a5)
loc_15CA62:
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
