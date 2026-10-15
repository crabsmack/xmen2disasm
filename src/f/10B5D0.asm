; ---------------------------------------------------------------------------
; sub_10B5D0	[jt 1358]
; ---------------------------------------------------------------------------
sub_10B5D0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$11(a4)
	bne.s	loc_10B626
	move.w	$8(a4),$C(a4)
	move.w	$A(a4),d0
	add.w	d0,$8(a4)
	tst.w	g_SceneExitTimer(a5)
	bne.s	loc_10B61A
	cmpi.w	#$900,$8(a4)
	ble.s	loc_10B608
	move.w	#$900,$8(a4)
	clr.w	$A(a4)
	bra.s	loc_10B61A
loc_10B608:
	cmpi.w	#$F700,$8(a4)
	bge.s	loc_10B61A
	move.w	#$F700,$8(a4)
	clr.w	$A(a4)
loc_10B61A:
	move.w	$8(a4),d0
	asr.w	#$8,d0
	ext.l	d0
	add.l	d0,$4(a4)
loc_10B626:
	cmpi.l	#$C00,$4(a4)
	bge.s	loc_10B650
	tst.b	$10(a4)
	beq.s	loc_10B63E
	moveq	#$0,d0
	move.l	d0,g_CamShake(a5)
	bra.s	loc_10B656
loc_10B63E:
	tst.l	g_CamShake(a5)
	bne.s	loc_10B656
	lea.l	$2A72(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	bra.s	loc_10B656
loc_10B650:
	moveq	#$0,d0
	move.l	d0,g_CamShake(a5)
loc_10B656:
	tst.w	$12(a4)
	ble.s	loc_10B66A
	subq.w	#$1,$12(a4)
	tst.w	$12(a4)
	bge.s	loc_10B66A
	clr.w	$12(a4)
loc_10B66A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
