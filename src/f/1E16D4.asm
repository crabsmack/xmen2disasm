; ---------------------------------------------------------------------------
; Cyclops_DrawBeam_StepDiag - Cyclops_DrawBeam direction cases 3/4 (diagonals) and the wall-probe loop that follows
; In:  a6 frame of Cyclops_DrawBeam
; Out: none
; Evidence: steps (10, -10, 10) / (10, 10, 10), mirrored when facing left; loops Tile_TestAt until the record length; a hit jumps through Tbl_BeamCutCases
; ---------------------------------------------------------------------------
Cyclops_DrawBeam_StepDiag:
	moveq	#$A,d0
	moveq	#-$A,d1
	moveq	#$A,d2
	bra.s	loc_1E16E2
loc_1E16DC:
	moveq	#$A,d0
	moveq	#$A,d1
	moveq	#$A,d2
loc_1E16E2:
	tst.b	-$19(a6)
	beq.s	loc_1E16EA
	neg.w	d0
loc_1E16EA:
	move.w	d0,-$12(a6)
	move.w	d1,-$14(a6)
	move.w	-$6(a6),d7
	move.w	-$8(a6),d6
	add.w	g_CameraX(a5),d7
	add.w	g_CameraY(a5),d6
	moveq	#$0,d3
	move.b	g_SolidMapIsBg(a5),d3
	seq.b	d3
	moveq	#$0,d5
	moveq	#$0,d4
	move.b	$D(a4),d5
loc_1E1712:
	pea.l	($1).w
	pea.l	($7800).w
	move.l	d3,-(a7)
	move.w	d6,d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	lea.l	$18(a7),a7
	tst.b	d0
	bne.s	loc_1E174A
	add.w	-$12(a6),d7
	add.w	-$14(a6),d6
	add.w	d2,d4
	cmp.w	d4,d5
	bge.s	loc_1E1712
	moveq	#-$1,d7
	moveq	#-$1,d6
	bra.s	loc_1E1772
loc_1E174A:
	moveq	#$20,d0
	or.l	d0,$90(a3)
	moveq	#$0,d0
	move.b	$C(a4),d0
	add.w	d0,d0
	lea.l	Tbl_BeamCutCases(pc),a0
	adda.w	(a0,d0.w),a0
	jmp	(a0)
loc_1E1762:
	move.w	d4,d7
	moveq	#-$1,d6
	bra.s	loc_1E1772
