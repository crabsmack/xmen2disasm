; ---------------------------------------------------------------------------
; SavageA3_LoadLevel - SavageA3: load the level (Level_Load with the Perimeter2 class list $0B0280) and set limits/parallax factors
; In:  none
; Out: none
; Evidence: same settings as SavageA2_LoadLevel; TAS 32058
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA3_LoadLevel:
	link.w	a6,#$0
	lea.l	$1C6A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$70,d0
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
	lea.l	$1C5A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1A8A(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1ABA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$1C62(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> Level_Load
	clr.w	g_PalBase(a5)
	move.b	#$1,-$38B4(a5)
	clr.b	g_TwoPlayerStep(a5)
	clr.b	g_BgWrapY(a5)
	subi.w	#$60,g_CamMaxY(a5)
	move.w	g_CamMaxY(a5),g_CamMaxYTarget(a5)
	move.w	#$140,g_BgScrollFactorX(a5)
	move.w	#$120,g_BgScrollFactorY(a5)
	unlk	a6
	rts
