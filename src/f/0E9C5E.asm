; ---------------------------------------------------------------------------
; Hologram_Explode - hologram destroyed: explosion actor, pose $1B, mark segment +$A2, free its sprite tiles, re-enable XPower spawns
; In:  8(a6) = this
; Out: none
; Evidence: ACTOR New + ExplodeFx_ChainRepeat explosion; Spr_InvalidateFrame loop and VRAM pointer $FFCC68 -= tiles; Hologram_SetXPowerSpawns(1)
; ---------------------------------------------------------------------------
Hologram_Explode:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a3),-(a7)
	move.l	$8(a3),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_0E9CBA
	moveq	#$5,d0
	move.l	d0,-(a7)
	moveq	#$20,d1
	move.l	d1,-(a7)
	moveq	#-$10,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$281A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	lea.l	$18(a7),a7
loc_0E9CBA:
	moveq	#$1B,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetPose(pc)
	movea.l	$A2(a3),a0
	ori.b	#$40,(a0)
	move.w	$34(a3),d5
	move.w	$36(a3),d6
	moveq	#$2,d7
	movea.l	g_ObjTable(a5),a0
	movea.l	$8(a0),a4
	addq.w	#$4,a7
	bra.s	loc_0E9D1C
loc_0E9CE0:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E9D0C
	cmp.w	$34(a4),d5
	bge.s	loc_0E9D0C
	pea.l	$2E(a4)
	jsr	$5072(a5)	; -> Spr_InvalidateFrame
	sub.w	d6,$34(a4)
	addq.w	#$4,a7
loc_0E9D0C:
	addq.w	#$1,d7
	move.w	d7,d0
	ext.l	d0
	movea.l	g_ObjTable(a5),a0
	asl.l	#$2,d0
	movea.l	(a0,d0.l),a4
loc_0E9D1C:
	cmp.w	g_ObjCount(a5),d7
	blt.s	loc_0E9CE0
	sub.w	d6,g_VramTileCursor(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetXPowerSpawns(pc)
	addq.w	#$4,a7
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
