; ---------------------------------------------------------------------------
; Water_DrawSplash - draw a water splash: frame timer/4 at (x, y)
; In:  8(a6) = player, $E(a6) = word timer, $12(a6) = word x, $16(a6) = word y
; Out: none
; Evidence: Spr_SetFrame + Spr_Draw on the splash sprite -$3C0E; caller Water_DrawHook
; Found: link-after-rts
; ---------------------------------------------------------------------------
Water_DrawSplash:
	link.w	a6,#$FFFE
	movem.l	d4-d7,-(a7)
	move.w	$E(a6),d5
	move.w	$16(a6),d6
	move.w	$12(a6),d7
	move.w	d5,d4
	asr.w	#$2,d4
	ext.l	d4
	move.l	d4,-(a7)
	move.l	g_WaterSplashSpr(a5),-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	sub.w	g_CameraX(a5),d7
	sub.w	g_CameraY(a5),d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	g_WaterSplashSpr(a5),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$14(a7),a7
	movem.l	-$12(a6),d4-d7
	unlk	a6
	rts
