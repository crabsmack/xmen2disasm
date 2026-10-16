; ---------------------------------------------------------------------------
; SentinelsD1_LoadLevel - SentinelsD1: load the Exterior_1 level (Level_Load with its class list Tbl_SentinelsD1ClassList (jt $23B2)) and palette line 2
; In:  none
; Out: d0
; Evidence: 16 words Pal_SentinelsLine2 (jt $241A) -> g_PalBase+$40; parallax factors $C0/$80; TAS 2381
; Found: link-after-rts
; ---------------------------------------------------------------------------
SentinelsD1_LoadLevel:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$23B2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$23A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23AA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23AA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	lea.l	$241A(a5),a0
	movea.l	$2(a0),a3
	lea.l	g_PalBase+$40(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$40(a7),a7
loc_0DC452:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_0DC452
	move.b	#$1,g_HudOn(a5)
	move.w	#$C0,g_BgScrollFactorY(a5)
	move.w	#$80,g_BgScrollFactorX(a5)
	clr.b	g_TwoPlayerStep(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
