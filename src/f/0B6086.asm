; ---------------------------------------------------------------------------
; SavageA4_InitEffectSprite - SavageA4: set up the chamber effect sprite ($FFCC6A, art $0B533E)
; In:  none
; Out: none
; Evidence: Spr_Init; frame counters -$3B3A/-$3B32 := 0
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_InitEffectSprite:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1C9A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$506A(a5)	; -> Spr_Init
	clr.w	g_SceneVar3B3A(a5)
	clr.w	g_SceneVar3B32(a5)
	unlk	a6
	rts
