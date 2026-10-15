; ---------------------------------------------------------------------------
; PortraitActor_StateWaitTurn - portrait: count down, wait until neither cursor is busy, then load the new character and fly it in
; In:  8(a6) = this
; Out: d0
; Evidence: cursors -$3B28/-$3B2C +$34 busy; next PortraitActor_StartFlyIn
; ---------------------------------------------------------------------------
PortraitActor_StateWaitTurn:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$8C(a3),a4
	tst.b	$33(a4)
	beq.s	loc_0679B2
	move.l	a4,-(a7)
	jsr	PlayerSelect_RevertCursor(pc)
	clr.b	$34(a4)
	move.w	#$1E,$2E(a4)
	move.w	#$A,$3A(a4)
	addq.w	#$4,a7
loc_0679B2:
	tst.w	$2E(a4)
	beq.s	loc_0679D0
	subq.w	#$1,$2E(a4)
	clr.w	$6C(a3)
	lea.l	PortraitActor_StateWaitTurn(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_067A4C
loc_0679D0:
	moveq	#$1,d3
	movea.l	g_SceneVar3B28(a5),a0
	tst.b	$34(a0)
	bne.s	loc_0679E8
	movea.l	g_SceneVar3B2C(a5),a0
	tst.b	$34(a0)
	bne.s	loc_0679E8
	moveq	#$0,d3
loc_0679E8:
	move.b	d3,d7
	bne.s	loc_067A3A
	move.b	#$1,$34(a4)
	move.l	$8C(a3),-(a7)
	jsr	PlayerSelect_CharSpriteDef(pc)
	move.l	d0,$30(a3)
	addq.w	#$4,a7
	beq.s	loc_067A12
	move.l	$8C(a3),-(a7)
	jsr	PlayerSelect_CharFrameNum(pc)
	move.w	d0,$A4(a3)
	addq.w	#$4,a7
	bra.s	loc_067A18
loc_067A12:
	move.w	#$FF,$A4(a3)
loc_067A18:
	move.b	$A5(a3),$2F(a3)
	move.l	a3,-(a7)
	jsr	PlayerSelect_CalcPortraitPos(pc)
	addq.w	#$4,a7
	clr.w	$6C(a3)
	lea.l	PortraitActor_StartFlyIn(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
	bra.s	loc_067A4C
loc_067A3A:
	clr.w	$6C(a3)
	lea.l	PortraitActor_StateWaitTurn(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$8,d0
	and.w	$4(a3),d0
loc_067A4C:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
