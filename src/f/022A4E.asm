; ---------------------------------------------------------------------------
; AvalonA2_LoadLevel - load the AvalonA2 level with Level_Load and set its initial palette line 2
; In:  none
; Out: none
; Evidence: Level_Load(... jt $267A0 class list ...); copies 16 colours from jt $22BCA to $FFC8C0; g_PalBase[0] = 0
; ---------------------------------------------------------------------------
AvalonA2_LoadLevel:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	$532(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$A,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$522(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$51A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$51A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$A2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$52A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	lea.l	$50A(a5),a0
	movea.l	$2(a0),a3
	lea.l	-$3940(a5),a4
	moveq	#$0,d7
	moveq	#$10,d3
	lea.l	$40(a7),a7
loc_022AC2:
	move.w	(a3)+,(a4)+
	move.l	d7,d0
	addq.l	#$1,d7
	cmp.l	d7,d3
	bgt.s	loc_022AC2
	clr.b	g_TwoPlayerStep(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
