; ---------------------------------------------------------------------------
; SentinelsA1_LoadLevel - SentinelsA1: load the stage data through the scene loader and set camera/scroll parameters
; In:  none
; Out: none
; Evidence: Level_Load with level data thunks $0DFB0C/$0E2D9C/$0DFA42/$0E2D4E; sets byte $FFC922 = 1 (half-rate frame stepping)
; ---------------------------------------------------------------------------
SentinelsA1_LoadLevel:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	clr.b	d5
	clr.b	d6
	moveq	#$1,d7
	clr.b	d4
	lea.l	$2612(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	moveq	#$23,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$0,d2
	move.b	d7,d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	d6,d2
	move.l	d2,-(a7)
	moveq	#$0,d2
	move.b	d5,d2
	move.l	d2,-(a7)
	move.l	d0,-(a7)
	lea.l	$2602(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$261A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$261A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$260A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$260A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	clr.b	-$38B4(a5)
	move.b	#$1,-$38B4(a5)
	move.w	#$80,g_BgScrollFactorX(a5)
	move.w	#$80,g_BgScrollFactorY(a5)
	clr.w	g_FgScrollBaseY(a5)
	clr.w	g_BgScrollBaseY(a5)
	clr.w	g_FgScrollBaseX(a5)
	clr.w	g_BgScrollBaseX(a5)
	clr.b	g_TwoPlayerStep(a5)
	move.b	#$1,g_TwoPlayerStep(a5)
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
