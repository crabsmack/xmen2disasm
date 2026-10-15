; ---------------------------------------------------------------------------
; Psylocke_Init - PSYLOCKE slot +$12: XCLIMBER Init plus Psylocke's record, states and two sprites (body and psi effect)
; In:  8(a6) = player, $C/$10/$14(a6) = Init args
; Out: none
; Evidence: parent +$12; +$8C = char record (jt $9002 thunk); +$60 = XPlayer_StateHurt; +$C0 |= $100 (wall jump on grab); Spr_Init body +$2E and effect +$C6 (def $15B220), Spr_PreloadToHeap; $FFE95A = effect sprite
; ---------------------------------------------------------------------------
Psylocke_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BAA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$45CA(a5),a0
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
	ori.w	#$100,$C0(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9DEE
	move.w	g_P1VramTile(a5),d1
	bra.s	loc_1B9DF2
loc_1B9DEE:
	move.w	g_P2VramTile(a5),d1
loc_1B9DF2:
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	lea.l	$464A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_1B9E22
	move.w	g_P1VramTile(a5),d0
	bra.s	loc_1B9E26
loc_1B9E22:
	move.w	g_P2VramTile(a5),d0
loc_1B9E26:
	ext.l	d0
	move.w	g_PlayerTiles(a5),d1
	ext.l	d1
	add.l	d0,d1
	move.w	d1,d7
	sub.w	#$10,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$3F72(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	$C6(a4)
	jsr	$506A(a5)	; -> Spr_Init
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	$C6(a4)
	jsr	$505A(a5)	; -> Spr_PreloadToHeap
	lea.l	$C6(a4),a0
	move.l	a0,g_PsylockeFxSpr(a5)
	lea.l	$50(a7),a7
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
