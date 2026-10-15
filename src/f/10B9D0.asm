; ---------------------------------------------------------------------------
; SpaceA1_LoadLevel - SpaceA1: load the stage data through the scene loader and set stage flags
; In:  none
; Out: none
; Evidence: Level_Load with level data thunks $107AF2/$10A054/$107AB4/$10A02A; TAS frame 37205 once
; ---------------------------------------------------------------------------
SpaceA1_LoadLevel:
	link.w	a6,#$0
	lea.l	$2A62(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$3E,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$2A52(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A6A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A6A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A5A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2A5A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	move.b	#$1,-$38B4(a5)
	clr.b	g_BgWrapX(a5)
	clr.w	g_BgScrollFactorY(a5)
	move.w	#$100,g_BgScrollFactorX(a5)
	clr.b	g_TwoPlayerStep(a5)
	unlk	a6
	rts
