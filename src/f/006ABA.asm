; ---------------------------------------------------------------------------
; Game_InitButtonMasks - set the joypad button-mask globals and precompute the player VRAM size
; In:  none
; Out: none
; Evidence: jt 10, once at TAS frame 7; masks 4,8,$C,1,2,3,$20,$10,$40,$400,$200,$100,$800 = Left,Right,L|R,Up,Down,U|D,C,B,A,X,Y,Z,Mode (Genesis 6-button bit order); -$3BB6 = Player_CalcMaxTiles; Rand_Seed($1A3)
; ---------------------------------------------------------------------------
Game_InitButtonMasks:
	link.w	a6,#$0
	move.w	#$4,g_PadMaskLeft(a5)
	move.w	#$8,g_PadMaskRight(a5)
	move.w	g_PadMaskRight(a5),d0
	or.w	g_PadMaskLeft(a5),d0
	move.w	d0,g_PadMaskLeftRight(a5)
	move.w	#$1,g_PadMaskUp(a5)
	move.w	#$2,g_PadMaskDown(a5)
	move.w	g_PadMaskDown(a5),d0
	or.w	g_PadMaskUp(a5),d0
	move.w	d0,g_PadMaskUpDown(a5)
	move.w	#$20,g_PadMaskC(a5)
	move.w	#$10,g_PadMaskB(a5)
	move.w	#$40,g_PadMaskA(a5)
	move.w	#$400,g_PadMaskX(a5)
	move.w	#$200,g_PadMaskY(a5)
	move.w	#$100,g_PadMaskZ(a5)
	move.w	#$800,g_PadMaskMode(a5)
	jsr	Player_CalcMaxTiles(pc)
	move.w	d0,-$3BB6(a5)
	pea.l	($1A3).w
	jsr	$4182(a5)	; -> Rand_Seed
	unlk	a6
	rts
