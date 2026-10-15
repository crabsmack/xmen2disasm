; ---------------------------------------------------------------------------
; BanimazaDoor_StateWaitRespawn - BANIMAZADOOR: when both players are clear, reset with 4 health
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: BanimazaDoor_PlayerClear for g_Player1/g_Player2; +$68 = 4; next BanimazaDoor_StateReset; retries every 10 frames
; ---------------------------------------------------------------------------
BanimazaDoor_StateWaitRespawn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_Player1(a5)
	move.l	a4,-(a7)
	jsr	BanimazaDoor_PlayerClear(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_03A286
	pea.l	g_Player2(a5)
	move.l	a4,-(a7)
	jsr	BanimazaDoor_PlayerClear(pc)
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_03A286
	move.w	#$4,$68(a4)
	clr.w	$6A(a4)
	lea.l	BanimazaDoor_StateReset(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	bra.s	loc_03A296
loc_03A286:
	lea.l	BanimazaDoor_StateWaitRespawn(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$A,$6C(a4)
	moveq	#$0,d0
loc_03A296:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
