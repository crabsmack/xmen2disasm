; ---------------------------------------------------------------------------
; AvalonA3_InitSprites - set up the four AvalonA3 animated sprite slots (jt $2B3C6) at consecutive VRAM tiles
; In:  none
; Out: none
; Evidence: Spr_Init on -$3582/-$356E/-$355A/-$3546 at tile -$3AAE + 0/$10/$20/$30; staggered timers 0-3 in -$3CBC..-$3CC8
; ---------------------------------------------------------------------------
AvalonA3_InitSprites:
	link.w	a6,#$0
	move.l	d7,-(a7)
	clr.w	d7
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	lea.l	$602(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$14(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$602(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$28(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	moveq	#$20,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$602(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$3C(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	moveq	#$30,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$602(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites+$50(a5)
	jsr	$506A(a5)	; -> Spr_Init
	clr.w	g_AvalonA3SprDelays+$C(a5)
	move.w	#$1,g_AvalonA3SprDelays+$8(a5)
	move.w	#$2,g_AvalonA3SprDelays+$4(a5)
	move.w	#$3,g_AvalonA3SprDelays(a5)
	lea.l	$70(a7),a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
