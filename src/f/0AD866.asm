; ---------------------------------------------------------------------------
; SavageA2_LoadLevel - SavageA2: load the level (Level_Load with the Perimeter1 class list $0A7664) and set limits/parallax factors
; In:  none
; Out: none
; Evidence: max y -= $60; g_BgScrollFactorX := $140, g_BgScrollFactorY := $120; TAS 30752
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_LoadLevel:
	link.w	a6,#$0
	lea.l	$1AC2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$6F,d0
	move.l	d0,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$1AB2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1ABA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1ABA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	move.b	#$1,g_HudOn(a5)
	clr.b	g_TwoPlayerStep(a5)
	clr.b	g_BgWrapY(a5)
	subi.w	#$60,g_CamMaxY(a5)
	move.w	g_CamMaxY(a5),g_CamMaxYTarget(a5)
	move.w	#$140,g_BgScrollFactorX(a5)
	move.w	#$120,g_BgScrollFactorY(a5)
	unlk	a6
	rts
