; ---------------------------------------------------------------------------
; Cyclops_Init - CYCLOPS slot +$12: XPLAYER Init, Cyclops's record, states, gravity, body sprite, cleared beam fields
; In:  8(a6) = player  $C(a6)/$10(a6) = x/y  $14(a6) = spawn param
; Out: none
; Evidence: +$90 &= ~$2000; byte $FFE958 (P1) / $FFE956 (P2) := 1; +$8C = record (jt -> $1E2A52); gravity record +$E; Spr_Init(+$2E, jt $4D42 sprite); +$CA = 0; Mem_Set(+$BC, 0, $26); +$C6 = $FF; +$C2 = $FFFF
; ---------------------------------------------------------------------------
Cyclops_Init:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	andi.l	#$FFFFDFFF,$90(a4)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	lea.l	$10(a7),a7
	bne.s	loc_1E3B06
	move.b	#$1,g_P1HasMeter(a5)
	bra.s	loc_1E3B0C
loc_1E3B06:
	move.b	#$1,g_P2HasMeter(a5)
loc_1E3B0C:
	lea.l	$4AA2(a5),a0
	move.l	$2(a0),$8C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	$A6(a0),$64(a4)
	lea.l	$4D22(a5),a0
	move.l	a0,$60(a4)
	clr.l	$16(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	$18(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1E3B60
	move.w	-$3BB2(a5),d1
	bra.s	loc_1E3B64
loc_1E3B60:
	move.w	-$3BB4(a5),d1
loc_1E3B64:
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	lea.l	$4B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	clr.w	$CA(a4)
	moveq	#$26,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	$BC(a4)
	jsr	$4DB2(a5)	; -> Mem_Set
	move.b	#$FF,$C6(a4)
	move.w	#$FFFF,$C2(a4)
	lea.l	$28(a7),a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
