; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_part1 - part 1 of PlayerSelect_LoadCharFrame: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of PlayerSelect_LoadCharFrame
; Out: continues in PlayerSelect_LoadCharFrame
; Evidence: only reached by branches from PlayerSelect_LoadCharFrame; ends with rts
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_part1:
	moveq	#$0,d0
	movea.l	d0,a4
	move.w	#$FF,d7
	move.l	a4,d0
	beq.s	loc_064890
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$50AA(a5)	; -> Spr_RenderToBitmap
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	move.l	a3,-(a7)
	jsr	Cerebro_BigSpriteInit(pc)
	lea.l	$14(a7),a7
loc_064890:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
