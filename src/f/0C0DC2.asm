; ---------------------------------------------------------------------------
; Water_Init - set up the hazard water: splash sprite (resource variant n), surface y and splash y; water hurts
; In:  8(a6) = word variant, $A(a6) = word surface y, $E(a6) = word splash y
; Out: none
; Evidence: SprDef_Add(jt[$0DCA], n) -> sprite record -$3C0E; -$3C10 surface, -$3C12 splash y, -$3C0A/-$3C08 := 0, -$3C14 := 1; callers SavageC1/B1_RunScene, SavageA2_InitFlood
; Found: jt 1116
; ---------------------------------------------------------------------------
Water_Init:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	lea.l	$2372(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	ext.l	d0
	move.l	d0,d7
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	adda.w	d0,a0
	move.l	a0,g_WaterSplashSpr(a5)
	move.w	$E(a6),g_WaterSurfaceY(a5)
	move.w	$12(a6),g_WaterSplashY(a5)
	clr.w	g_P2SplashTimer(a5)
	clr.w	g_P1SplashTimer(a5)
	move.b	#$1,g_WaterHurts(a5)
	move.l	-$4(a6),d7
	unlk	a6
	rts
