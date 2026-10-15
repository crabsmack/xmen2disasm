; ---------------------------------------------------------------------------
; Magneto_GroundSpecial - MAGNETO slot +$DE: A on the ground: flux bomb forward / up-diagonal / down-diagonal
; In:  8(a6) = player
; Out: none
; Evidence: +$10 = 0; +$BC = Up 6/3, Down 8/1, else 7/2; Magneto_StartBomb
; ---------------------------------------------------------------------------
Magneto_GroundSpecial:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$10(a4)
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE9A6
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE9AE
loc_1CE9A6:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE9AE:
	beq.s	loc_1CE9C8
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE9C0
	move.w	#$6,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9C0:
	move.w	#$3,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9C8:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE9DC
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE9E4
loc_1CE9DC:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE9E4:
	beq.s	loc_1CE9FE
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE9F6
	move.w	#$8,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9F6:
	move.w	#$1,$BC(a4)
	bra.s	loc_1CEA14
loc_1CE9FE:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CEA0E
	move.w	#$7,$BC(a4)
	bra.s	loc_1CEA14
loc_1CEA0E:
	move.w	#$2,$BC(a4)
loc_1CEA14:
	lea.l	Magneto_StartBomb(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartBomb(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
