; ---------------------------------------------------------------------------
; Game_InitButtonMasks - set the joypad button-mask globals and precompute the player VRAM size
; In:  none
; Out: none
; Evidence: jt 10, once at TAS frame 7; masks 4,8,$C,1,2,3,$20,$10,$40,$400,$200,$100,$800 = Left,Right,L|R,Up,Down,U|D,C,B,A,X,Y,Z,Mode (Genesis 6-button bit order); -$3BB6 = Player_CalcMaxTiles; sub_160512($1A3)
; ---------------------------------------------------------------------------
Game_InitButtonMasks:
	link.w	a6,#$0
	move.w	#$4,-$3B98(a5)
	move.w	#$8,-$3B9A(a5)
	move.w	-$3B9A(a5),d0
	or.w	-$3B98(a5),d0
	move.w	d0,-$3B9C(a5)
	move.w	#$1,-$3B9E(a5)
	move.w	#$2,-$3BA0(a5)
	move.w	-$3BA0(a5),d0
	or.w	-$3B9E(a5),d0
	move.w	d0,-$3BA2(a5)
	move.w	#$20,-$3BA4(a5)
	move.w	#$10,-$3BA6(a5)
	move.w	#$40,-$3BA8(a5)
	move.w	#$400,-$3BAA(a5)
	move.w	#$200,-$3BAC(a5)
	move.w	#$100,-$3BAE(a5)
	move.w	#$800,-$3BB0(a5)
	jsr	Player_CalcMaxTiles(pc)
	move.w	d0,-$3BB6(a5)
	pea.l	($1A3).w
	jsr	$4182(a5)	; -> sub_160512
	unlk	a6
	rts
