; ---------------------------------------------------------------------------
; AvalonB2_InitSprite - set up the AvalonB2 sprite slot g_SceneSprites (sprite def jt $21AE2, frame 0) at VRAM tile g_FgTilesEnd and load it
; In:  none
; Out: none
; Evidence: Spr_Init(g_SceneSprites, 1, jt $21AE2, 0, 0, g_FgTilesEnd, 1); animated by AvalonB2_AnimSprite
; ---------------------------------------------------------------------------
AvalonB2_InitSprite:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	lea.l	$4EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
