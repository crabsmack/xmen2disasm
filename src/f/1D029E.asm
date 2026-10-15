; ---------------------------------------------------------------------------
; Gambit_Init - GAMBIT slot +$12: XPLAYER Init, Gambit's record, states and gravity, body sprite, card and trail tiles preloaded, card array cleared
; In:  8(a6) = player  $C(a6)/$10(a6) = x/y  $14(a6) = spawn param
; Out: none
; Evidence: +$90 &= ~$2000; byte $FFE958 (P1) / $FFE956 (P2) := 1; +$8C = Tbl_GambitCharRecord; +$20 = $5C; Spr_Init(+$2E, Art_EvilGambitSpr); +$C0 = tile base, Art_GambitSpr (card) and Art_GambitSpr2 (trail, base+$C) via Spr_PreloadToHeap; +$C2 = 0; +$BC = $FFE95E; Gambit_ClearCards
; ---------------------------------------------------------------------------
Gambit_Init:
	link.w	a6,#$FFEC
	movem.l	d3/a3-a4,-(a7)
	lea.l	-$18A2(a5),a3
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	andi.l	#$FFFFDFFF,$90(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	lea.l	$10(a7),a7
	bne.s	loc_1D02EA
	move.b	#$1,g_P1HasMeter(a5)
	bra.s	loc_1D02F0
loc_1D02EA:
	move.b	#$1,g_P2HasMeter(a5)
loc_1D02F0:
	lea.l	$4902(a5),a0
	move.l	$2(a0),$8C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	$A6(a0),$64(a4)
	lea.l	$4D22(a5),a0
	move.l	a0,$60(a4)
	clr.l	$16(a4)
	clr.w	$1E(a4)
	move.w	#$5C,$20(a4)
	movea.l	$8C(a4),a0
	move.w	$18(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D0344
	move.w	-$3BB2(a5),d1
	bra.s	loc_1D0348
loc_1D0344:
	move.w	-$3BB4(a5),d1
loc_1D0348:
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	lea.l	$49A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1D0378
	move.w	-$3BB2(a5),d0
	bra.s	loc_1D037C
loc_1D0378:
	move.w	-$3BB4(a5),d0
loc_1D037C:
	ext.l	d0
	move.w	-$3BB6(a5),d1
	ext.l	d1
	add.l	d0,d1
	sub.w	#$D,d1
	move.w	d1,$C0(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$C0(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$49BA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	$C0(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$505A(a5)	; -> Spr_PreloadToHeap
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$C0(a4),d1
	ext.l	d1
	moveq	#$C,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$49C2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> Spr_Init
	move.w	$C0(a4),d0
	ext.l	d0
	moveq	#$C,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	pea.l	-$14(a6)
	jsr	$505A(a5)	; -> Spr_PreloadToHeap
	clr.b	$C2(a4)
	move.l	a3,$BC(a4)
	move.l	a4,-(a7)
	jsr	Gambit_ClearCards(pc)
	lea.l	$68(a7),a7
	movem.l	-$20(a6),d3/a3-a4
	unlk	a6
	rts
