; ---------------------------------------------------------------------------
; BaniMazaA2_InitSprite - set up the BaniMazaA2 sprite slot -$3596 (jt $46CCA) at tile -$3AAE
; In:  none
; Out: none
; Evidence: Spr_Init(-$3596, 1, jt $46CCA, 0, 0, -$3AAE, 1)
; ---------------------------------------------------------------------------
BaniMazaA2_InitSprite:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	lea.l	$95A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
